ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_issue_timetrack] DEFAULT (NULL) FOR [issue_timetrack];

