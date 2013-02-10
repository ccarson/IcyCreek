ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_issue_svn_link] DEFAULT (NULL) FOR [issue_svn_link];

