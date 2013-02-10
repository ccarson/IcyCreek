ALTER TABLE [dbo].[pt_todolists]
    ADD CONSTRAINT [DF_pt_todolists_added] DEFAULT (NULL) FOR [added];

