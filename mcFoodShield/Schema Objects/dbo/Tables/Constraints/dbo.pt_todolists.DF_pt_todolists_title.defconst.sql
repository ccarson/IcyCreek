ALTER TABLE [dbo].[pt_todolists]
    ADD CONSTRAINT [DF_pt_todolists_title] DEFAULT (NULL) FOR [title];

