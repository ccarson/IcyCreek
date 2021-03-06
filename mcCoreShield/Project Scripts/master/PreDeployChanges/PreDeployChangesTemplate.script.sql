/*
************************************************************************************************************************************
     Script:    PreDeployChangesTemplate.script.sql
    Purpose:    Documents usage of the PreDeployChanges folder
    
    This folder should contain scripts for any changes required for the PreDeploy portion of a project publish
    Examples could be: 
        data extracts ( for later conversion )

    USAGE:
    1)  Create a script for each set of changes
    2)  Place each script in the PreDeployChanges folder
    3)  Determine the order in which the scripts need to execute before the database publishes 
    4)  Add commands to the PreDeployChanges.script.sql script to execute commands in proper order 
    
    NOTES
************************************************************************************************************************************
*/

--  Add SQL Statements here