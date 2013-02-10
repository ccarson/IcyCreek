ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_svnurl] DEFAULT (NULL) FOR [svnurl];

