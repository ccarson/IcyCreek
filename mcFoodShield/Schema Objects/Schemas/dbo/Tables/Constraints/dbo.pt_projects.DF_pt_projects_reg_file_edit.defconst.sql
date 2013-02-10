ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_file_edit] DEFAULT (NULL) FOR [reg_file_edit];

