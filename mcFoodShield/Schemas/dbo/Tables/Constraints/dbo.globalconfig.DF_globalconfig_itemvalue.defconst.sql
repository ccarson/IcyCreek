ALTER TABLE [dbo].[globalconfig]
    ADD CONSTRAINT [DF_globalconfig_itemvalue] DEFAULT (N'') FOR [itemvalue];

