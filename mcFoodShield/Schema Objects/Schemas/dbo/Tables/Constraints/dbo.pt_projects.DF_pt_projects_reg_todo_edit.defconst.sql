ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_todo_edit] DEFAULT (NULL) FOR [reg_todo_edit];

