ALTER TABLE [dbo].[pt_todos]
    ADD CONSTRAINT [DF_pt_todos_due] DEFAULT (NULL) FOR [due];

