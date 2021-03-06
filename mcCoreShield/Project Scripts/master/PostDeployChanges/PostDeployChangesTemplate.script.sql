/*
************************************************************************************************************************************
     Script:    PostDeployChangesTemplate.script.sql
    Purpose:    Documents usage of the PostDeployChanges folder
    
    This folder should contain scripts for any changes required for the PostDeploy portion of a project publish
    Examples could be: 
        data conversion scripts
        create/update SQL Agent jobs
        grant/revoke permissions
        special backups
        progress report queries after publish

    USAGE:
    1)  Create a script for each set of changes
    2)  Place each script in the PostDeployChanges folder
    3)  Determine the order in which the scripts need to execute after the database publishes 
    4)  Add commands to the PostDeployChanges.script.sql script to execute commands in proper order 
    
    NOTES
************************************************************************************************************************************
*/

--  Add SQL Statements here