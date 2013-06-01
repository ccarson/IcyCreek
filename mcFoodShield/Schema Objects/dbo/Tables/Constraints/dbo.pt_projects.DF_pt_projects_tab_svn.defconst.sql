ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_tab_svn] DEFAULT (NULL) FOR [tab_svn];

