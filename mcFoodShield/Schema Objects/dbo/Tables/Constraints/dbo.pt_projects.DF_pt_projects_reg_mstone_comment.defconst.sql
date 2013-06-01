ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_mstone_comment] DEFAULT (NULL) FOR [reg_mstone_comment];

