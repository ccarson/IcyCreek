ALTER TABLE [dbo].[pt_todos]
    ADD CONSTRAINT [DF_pt_todos_added] DEFAULT (NULL) FOR [added];

