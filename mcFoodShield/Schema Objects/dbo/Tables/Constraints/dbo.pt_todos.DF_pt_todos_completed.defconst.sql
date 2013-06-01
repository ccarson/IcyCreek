ALTER TABLE [dbo].[pt_todos]
    ADD CONSTRAINT [DF_pt_todos_completed] DEFAULT (NULL) FOR [completed];

