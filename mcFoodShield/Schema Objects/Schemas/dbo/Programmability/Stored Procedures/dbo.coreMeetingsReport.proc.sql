﻿CREATE procedure [dbo].[coreMeetingsReport]
AS

BEGIN

DECLARE @command AS NVARCHAR(MAX) ;
DECLARE @sql AS NVARCHAR(MAX) ;

IF  OBJECT_ID('tempdb..#meetings') IS NOT NULL
	DROP TABLE #meetings ;


IF  OBJECT_ID('tempdb..#databases') IS NOT NULL
	DROP TABLE #databases ;

-- find databases with a dbo.meetings table
select name into #databases from sys.databases where 1=0 ;

SET NOCOUNT ON ; 

--	enumerate affected databases
SET @command = '
insert into #databases (name)
select ''@name''
where exists (select 1 
			  from @name.information_schema.tables 
			  where TABLE_NAME = ''meetings'' ) ' + CHAR(13) ;

SELECT @sql =  ISNULL( @sql, '' ) + REPLACE( @command, '@name', name ) 
			   FROM master.sys.databases ; 
			   
		
execute sp_executeSQL @sql; 


--DROP table #databases

SELECT  CAST(null AS NVARCHAR(20) ) as portal
	  , id, sMeetingName, iConnectID, dStartDateTime, dEndDateTime
	  , iTimeZoneID, bRecurring, iCreatedBy, dCreated, bPriority
	  , bActive, iSchedulerID, iAgendaID, iMeetingType
	  , bInConnect, sSummary, groupID
  INTO #meetings
  FROM mcfoodshield.dbo.meetings 
 WHERE 1=0 ;

-- query to be run against enumerated databases
SET @command = '
SET  IDENTITY_INSERT #meetings ON ; 

INSERT INTO #meetings ( 
	portal, id, sMeetingName, iConnectID
		, dStartDateTime, dEndDateTime, iTimeZoneID
		, bRecurring, iCreatedBy, dCreated, bPriority
		, bActive, iSchedulerID, iAgendaID, iMeetingType
		, bInConnect, sSummary, groupID )
SELECT ''@name'', id, sMeetingName, iConnectID
		, dStartDateTime, dEndDateTime, iTimeZoneID
		, bRecurring, iCreatedBy, dCreated, bPriority
		, bActive, iSchedulerID, iAgendaID, iMeetingType
		, bInConnect, sSummary, groupID
  FROM  @name.dbo.meetings ;

SET  IDENTITY_INSERT #meetings OFF ; ' ;

SET @sql = NULL ;			   
			   
SELECT  @sql = ISNULL( @sql, '' ) + REPLACE( @command, '@name', name ) 
			   FROM #databases ;    

execute sp_executeSQL @sql ;

select * from #meetings ;
select portal
		, MONTH(dstartdatetime)
		, DATENAME(MONTH,dstartdatetime)
		, YEAR(dstartdatetime)
		, COUNT(*)
  FROM #meetings
 group by portal,  MONTH(dstartdatetime), DATENAME(MONTH,dstartdatetime),YEAR(dstartdatetime)
 order by 1,2
 

drop table #databases;
drop table #meetings;
end
