ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_mstone_view] DEFAULT (NULL) FOR [reg_mstone_view];

