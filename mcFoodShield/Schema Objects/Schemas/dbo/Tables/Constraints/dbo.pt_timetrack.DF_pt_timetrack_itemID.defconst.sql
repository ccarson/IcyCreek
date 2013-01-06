ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_itemID] DEFAULT (NULL) FOR [itemID];

