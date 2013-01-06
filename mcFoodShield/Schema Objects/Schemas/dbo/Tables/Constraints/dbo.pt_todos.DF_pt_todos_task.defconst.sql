ALTER TABLE [dbo].[pt_todos]
    ADD CONSTRAINT [DF_pt_todos_task] DEFAULT (NULL) FOR [task];

