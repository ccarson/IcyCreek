ALTER TABLE [dbo].[pt_todos]
    ADD CONSTRAINT [DF_pt_todos_rank] DEFAULT (NULL) FOR [rank];

