ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_svn] DEFAULT (NULL) FOR [reg_svn];

