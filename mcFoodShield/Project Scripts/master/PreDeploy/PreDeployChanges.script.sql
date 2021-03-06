--  this SQLCMD variable should not be changed!
:setvar  PreDeployPath     ..\PreDeployChanges\

/*
************************************************************************************************************************************

     Script:    PreDeployChanges.script.sql
     Author:    Chris Carson 
    Purpose:    Any pre-deployment change scripts execute from here

    USAGE
    1)  Create a separate script for each pre-deploy change required
    2)  Save the script in the PreDeployChanges directory
    3)  Execute each script in the desired order from here ( refer to ###EXAMPLE below )


    NOTES
    Leave the SET NOCOUNT statements in place.  No statements in the script will cause SQL errors

************************************************************************************************************************************
*/

SET NOCOUNT ON ;

--  ### BEGIN EXAMPLE
--  :r  $(PreDeployPath)Script1.sql
--  :r  $(PreDeployPath)Script2.sql
--  :r  $(PreDeployPath)Script3.sql
--  ### END EXAMPLE

SET NOCOUNT OFF ;