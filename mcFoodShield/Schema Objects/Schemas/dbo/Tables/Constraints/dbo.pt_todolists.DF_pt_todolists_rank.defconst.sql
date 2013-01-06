ALTER TABLE [dbo].[pt_todolists]
    ADD CONSTRAINT [DF_pt_todolists_rank] DEFAULT (NULL) FOR [rank];

