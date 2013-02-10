ALTER TABLE [dbo].[globalconfig]
    ADD CONSTRAINT [DF_globalconfig_itemname] DEFAULT (N'') FOR [itemname];

