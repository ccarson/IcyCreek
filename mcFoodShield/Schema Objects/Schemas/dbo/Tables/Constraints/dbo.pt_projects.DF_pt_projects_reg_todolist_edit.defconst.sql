ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_todolist_edit] DEFAULT (NULL) FOR [reg_todolist_edit];

