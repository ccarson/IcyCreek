--  this SQLCMD variable should not be changed!
:setvar  PostDeployPath     ..\PostDeployChanges\

/*
************************************************************************************************************************************

     Script:    PostDeployChanges.script.sql
     Author:    Chris Carson 
    Purpose:    Any post-deployment change scripts execute from here

    USAGE
    1)  Create a separate script for each post-deploy change required
    2)  Save the script in the PostDeployChanges directory
    3)  Execute each script in the desired order from here ( refer to ###EXAMPLE below )


    NOTES
    Leave the SET NOCOUNT statements in place.  No statements in the script will cause SQL errors

************************************************************************************************************************************
*/

SET NOCOUNT ON ;

--  ### BEGIN EXAMPLE
--  :r  $(PostDeployPath)Script1.sql
--  :r  $(PostDeployPath)Script2.sql
--  :r  $(PostDeployPath)Script3.sql
--  ### END EXAMPLE

SET NOCOUNT OFF ;