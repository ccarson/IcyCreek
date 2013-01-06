ALTER TABLE [dbo].[pt_comments]
    ADD CONSTRAINT [DF_pt_comments_itemID] DEFAULT (NULL) FOR [itemID];

