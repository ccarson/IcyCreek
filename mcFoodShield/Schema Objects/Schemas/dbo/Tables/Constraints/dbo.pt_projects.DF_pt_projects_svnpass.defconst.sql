ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_svnpass] DEFAULT (NULL) FOR [svnpass];

