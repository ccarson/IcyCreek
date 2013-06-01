ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_svnuser] DEFAULT (NULL) FOR [svnuser];

