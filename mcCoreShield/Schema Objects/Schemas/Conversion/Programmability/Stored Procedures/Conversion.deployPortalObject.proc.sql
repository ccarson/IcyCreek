CREATE PROCEDURE [Conversion].[deployPortalObject]( @SchemaName NVARCHAR(50)
                                              , @ObjectName NVARCHAR(50)
                                              , @ObjectType NVARCHAR(50) )
AS
/*
************************************************************************************************************************************

   Procedure:   Conversion.deployPortalObject
      Author:   Chris Carson
     Purpose:   Applies new object definition across coreSHIELD portals

    Revision History:
    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2012-09-01      Created

Logic Summary:
    1) Enumerate coreSHIELD databases on server
    2) Create DDL for specified object
    3) Expand DDL to include all databases
    4) Execute generated DDL

Procedure Parameters:
    @SchemaName     NVARCHAR(50)    Schema name for object
    @ObjectName     NVARCHAR(50)    Name of object
    @ObjectType     NVARCHAR(50)    Procedure|View|Trigger|Synonym|Function

************************************************************************************************************************************
*/
BEGIN

    SET NOCOUNT ON ;

    DECLARE @rc             AS INT
          , @procName       AS NVARCHAR(100)
          , @sql            AS NVARCHAR(MAX)
          , @ddl            AS NVARCHAR(MAX)
          , @command        AS NVARCHAR(MAX)
          , @ErrorMessage   AS NVARCHAR(MAX)
          , @fullObjectName AS NVARCHAR(100) = @SchemaName + N'.' + @ObjectName ;

    --  1)  Enumerate coreSHIELD databases on server
    IF  OBJECT_ID('tempdb..#databases') IS NOT NULL
        DROP TABLE #databases ;

    SELECT  databaseName = name
      INTO  #databases
      FROM  master.sys.sysdatabases
     WHERE  1 = 0 ;

    SELECT  @command = N'
INSERT  #databases
SELECT  databaseName = ''@name''
 WHERE  OBJECT_ID ( ''@name..mc_contact'',''V'' ) IS NOT NULL
        AND ( ''@name'' NOT LIKE ''Archiv%'' AND ''@name'' <> ''coreSHIELD'' ) ;' + CHAR(13) ;

    SELECT  @sql = NULL ;
    SELECT  @sql = ISNULL( @sql, '' ) + REPLACE( @command, '@name', name )
      FROM  master.sys.databases ;

    EXECUTE sp_executeSQL @sql ;

    SELECT  @sql = NULL ;
    SELECT  @sql = ISNULL( @sql, '') + databaseName + ', '
      FROM  #databases ;

    --  2)  Create DDL for object being converted
     PRINT  N'    Building DDL for ' + @fullObjectName + '...' ;
     PRINT  '' ;

    SELECT  TOP 1
            @ddl = N'
USE [##DATABASE_NAME##] ;

PRINT ''    Converting ' + @fullObjectName + N' on ##DATABASE_NAME##... '' ;

IF  OBJECT_ID(''' + @fullObjectName + ''') IS NOT NULL
    DROP ' + @ObjectType + N' ' + @fullObjectName + ' ;

EXEC (N''' + REPLACE(eventDDL, '''', '''''' ) + N''') ;' + CHAR(13) + N'

PRINT ''    ...' + @fullObjectName + N' on ##DATABASE_NAME## Converted'' ;
'
      FROM  meta.DatabaseObjectChanges
     WHERE  SchemaName = 'Portal'
            AND ObjectName = @ObjectName
            AND ( EventType = 'CREATE_' + @ObjectType )
            AND @ObjectType IN ( 'Procedure', 'View', 'Trigger', 'Synonym','Function' )
  ORDER BY  EventDate DESC ;

    IF  @@ROWCOUNT = 0
    BEGIN
        PRINT 'Error: ' + @fullObjectName + ' not found -- unable to convert! '
        RETURN 16
    END

    SELECT  @ddl = REPLACE(@ddl, 'Portal.', @SchemaName + '.' ) ;
    SELECT  @ddl = REPLACE(@ddl, '###DATE###', CONVERT( VARCHAR(10), SYSDATETIME(), 120 ) ) ;


--  3)  Expand DDL to include all databases
    SELECT  @sql = NULL ;
    SELECT  @sql = ISNULL(@sql, '' ) + REPLACE(@ddl, '##DATABASE_NAME##', databaseName)
      FROM  #databases ;

     PRINT  N'    ...DDL Built!' ;
     PRINT  CAST( @ddl AS VARCHAR(MAX) ) ;
     PRINT  '' ;
     PRINT  N'    Executing Generated DDL...' ;


--  4)  Execute generated DDL
    BEGIN   TRY
        EXECUTE sp_executeSQL @sql ;
    END     TRY

    BEGIN   CATCH
        SELECT  @ErrorMessage = N'Error creating ' + @fullObjectName + CHAR(13) +
                                N'Error Number : ' + CAST( ERROR_NUMBER() AS NVARCHAR(20) ) + CHAR(13) +
                                N'Error Message: ' + ERROR_MESSAGE() ;
         PRINT  CAST( @sql AS VARCHAR(MAX) ) ;
        RAISERROR( @ErrorMessage, 16, 1 ) ;
        RETURN ;
    END     CATCH

     PRINT N'    ...' + @fullObjectName + N' deployed!' ;

END