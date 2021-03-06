﻿--CREATE PROCEDURE dbo.coreMeetingsReport
--AS 
--BEGIN
--
--    SET NOCOUNT ON ; 
--
--    DECLARE @command         AS NVARCHAR(MAX)
--          , @sql             AS NVARCHAR(MAX)
--          , @rptStartDate    AS DATETIME 
--          , @errorMessage    AS NVARCHAR(MAX)
--		  , @numberMonths    AS INT ;
--
----     1)  find databases with a dbo.meetings table
----        create temp table to hold database names
--    SELECT  name
--      INTO  #databases
--      FROM  sys.databases
--     WHERE  1 = 0 ;
--
----        load databases with meetings table into temp storage
--    SELECT     @command = 'INSERT INTO  #databases(name) '                                  + CHAR(13) + 
--                          '     SELECT  ''@name'' '                                         + CHAR(13) +
--                          '      WHERE  EXISTS ( SELECT  1 '                                + CHAR(13) + 
--                          '                        FROM  @name.INFORMATION_SCHEMA.TABLES '  + CHAR(13) +
--                          '                       WHERE  TABLE_NAME = ''meetings'' )  ;  '  + CHAR(13) ;
--    
--    SELECT  @sql = ISNULL(@sql, '') + REPLACE(@command, '@name', name)
--      FROM  master.sys.databases ; 
--               
--    BEGIN TRY
--        EXECUTE sp_executesql @sql ;
--    END TRY
--    BEGIN CATCH
--        SET @errorMessage = ( SELECT @errorMessage + 
--                                N'Error in dynamic SQL from ' + ERROR_PROCEDURE() + CHAR(13) + 
--                                N'SQL Error Code -- ' + CAST (ERROR_NUMBER() AS NVARCHAR(20)) + 
--                                N':  ' + ERROR_MESSAGE() + CHAR(13) + @sql ) ;
--        PRINT @errorMessage ;
--        RETURN 1 ;
--    END CATCH
--    
----  2)  create table on tempdb that will hold all data across databases
--    IF  EXISTS ( SELECT 1 FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'meetings' )
--        DROP TABLE tempdb.dbo.meetings ;
--
--    SELECT  CAST(NULL AS NVARCHAR(20)) AS portal
--                , CAST (NULL AS INT) AS n
--                , id, sMeetingName, iConnectID, dStartDateTime, dEndDateTime
--                , iTimeZoneID, bRecurring, iCreatedBy, dCreated, bPriority
--                , bActive, iSchedulerID, iAgendaID, iMeetingType, bInConnect
--                , sSummary, groupID
--      INTO  tempdb.dbo.meetings
--      FROM  mcfoodshield.dbo.meetings
--     WHERE  1 = 0 ;
--
----      remove IDENTITY property from new table ( this allows us to insert all data )     
--    ALTER TABLE tempdb.dbo.meetings DROP COLUMN id ;
--    EXECUTE tempdb.sys.sp_rename 'meetings.n', 'id' ;
--
----  3)  populate new table on tempdb
----      query each meetings table across all databases 
--    SET @command =  'INSERT INTO  tempdb.dbo.meetings '                                                   + CHAR(13) +
--                    '     SELECT  ''@name'', id, sMeetingName, iConnectID, dStartDateTime, dEndDateTime ' + CHAR(13) +
--                    '                    , iTimeZoneID, bRecurring, iCreatedBy, dCreated, bPriority '     + CHAR(13) +
--                    '                    , bActive, iSchedulerID, iAgendaID, iMeetingType '               + CHAR(13) +
--                    '                    , bInConnect, sSummary, groupID '                                + CHAR(13) +
--                    '       FROM  @name.dbo.meetings ;' ;
--
--    SET @sql = NULL ;               
--               
--    SELECT  @sql = ISNULL(@sql, '') + REPLACE(@command, '@name', name)
--      FROM  #databases ;    
--
--    BEGIN TRY
--        EXECUTE sp_executesql @sql ;
--    END TRY
--    BEGIN CATCH
--        SET @errorMessage = ( SELECT @errorMessage + 
--                                N'Error in dynamic SQL from ' + ERROR_PROCEDURE() + CHAR(13) + 
--                                N'SQL Error Code -- ' + CAST (ERROR_NUMBER() AS NVARCHAR(20)) + 
--                                N':  ' + ERROR_MESSAGE() + CHAR(13) + @sql ) ;
--        PRINT @errorMessage ;
--        RETURN 1 ;
--    END CATCH
--
----  4)  Build report output
----      proc sets a default date for the report start.  This parameter *could* be passed in    
--    
--    IF @rptStartDate IS NULL SELECT  @rptStartDate = CAST('2010-01-01' AS DATETIME) ;
--	
--	SELECT @numberMonths = DATEDIFF( month, @rptStartDate, SYSDATETIME() ) ;
--
----      tally table to calculate months of year, and compare it to tempdb.dbo.meetings    
--    
--    WITH          E1 (N) AS ( SELECT   1 
--                              UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
--                              UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
--                              UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 ) ,
--                  E2 (N) AS ( SELECT  1
--                                FROM  E1 AS a, E1 AS b ) ,
--                  E4 (N) AS ( SELECT  1
--                                FROM  E2 AS a, E2 AS b) ,
--            cteTally (N) AS ( SELECT  0 
--                               UNION  ALL
--                              SELECT  TOP ( @numberMonths ) ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
--                                FROM  E4 ) ,
--              cteMonths  AS ( SELECT  DISTINCT portal
--                                    , DATEADD(MONTH, N, @rptStartDate) AS rptMonth
--                                FROM  cteTally, tempdb.dbo.Meetings )
--    SELECT    mth.portal
--            , MONTH(rptMonth) AS iMonth
--            , DATENAME(MONTH, rptMonth) AS sMonth
--            , YEAR(rptMonth) AS Year
--            , COUNT(m.portal) AS Meetings
--      FROM  cteMonths AS mth
--    LEFT OUTER JOIN 
--            tempdb.dbo.meetings AS m 
--        ON  mth.portal = m.portal 
--       AND  MONTH(rptMonth) = MONTH(dstartdatetime) 
--       AND   YEAR(rptmonth) = YEAR(dstartdatetime)
--     GROUP  BY mth.portal, MONTH(rptMonth), DATENAME(MONTH, rptMonth), YEAR(rptMonth)
--     ORDER  BY 1, 4, 2 ;
--
--    DROP TABLE #databases ;
--    DROP TABLE tempdb.dbo.meetings ;
--END
--