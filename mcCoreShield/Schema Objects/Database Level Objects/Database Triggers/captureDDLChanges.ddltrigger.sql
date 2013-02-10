CREATE TRIGGER captureDDLChanges 
            ON DATABASE 
           FOR CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE 
                    , CREATE_VIEW, ALTER_VIEW, DROP_VIEW 
                    , CREATE_FUNCTION, ALTER_FUNCTION, DROP_FUNCTION 
                    , CREATE_TRIGGER, ALTER_TRIGGER, DROP_TRIGGER 
                    , CREATE_TABLE, ALTER_TABLE, DROP_TABLE 
                    , CREATE_SYNONYM, DROP_SYNONYM 
AS 
/* 
************************************************************************************************************************************ 
    Trigger: captureDDLChanges 
     Author: Chris Carson 
    Purpose: writes DDL changes to audit table 
    
    revisor     date        description 
    ---------   ----------  ---------------------------- 
    ccarson     2012-09-01  Implemented 
    
************************************************************************************************************************************
*/ 
BEGIN 

    SET NOCOUNT ON ;
    
    DECLARE @EventData  AS XML           = EVENTDATA() ;
    DECLARE @EventType  AS NVARCHAR(100) = @EventData.value( '(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)' ) 
          , @ObjectName AS NVARCHAR(255) = @EventData.value( '(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)' ) 
          
    DECLARE @ipAddress  AS NVARCHAR(32)  = ( SELECT client_net_address FROM sys.dm_exec_connections WHERE session_id = @@SPID ) ;
    
    DECLARE @eventDDL   AS NVARCHAR(MAX) = ( SELECT @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(MAX)') ) ;
    
    INSERT  Meta.DatabaseObjectChanges 
    SELECT  EventDate    = SYSDATETIME() 
          , EventType    = @EventType 
          , EventDDL     = @EventData.value( '(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','NVARCHAR(MAX)' ) 
          , EventXML     = @EventData 
          , DatabaseName = DB_NAME() 
          , SchemaName   = @EventData.value('(/EVENT_INSTANCE/SchemaName)[1]', 'NVARCHAR(255)') 
          , ObjectName   = @ObjectName 
          , HostName     = HOST_NAME() 
          , IPAddress    = @ipAddress 
          , ProgramName  = PROGRAM_NAME() 
          , LoginName    = SUSER_SNAME() ;
          

    IF  @EventType LIKE ('CREATE%') 
        DELETE  meta.DatabaseObjectChanges 
         WHERE  ObjectName = @ObjectName 
                AND EventType LIKE 'DROP%' AND EventDate < SYSDATETIME() ;

END
