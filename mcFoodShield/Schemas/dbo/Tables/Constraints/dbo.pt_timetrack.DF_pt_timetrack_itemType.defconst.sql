ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_itemType] DEFAULT (NULL) FOR [itemType];

