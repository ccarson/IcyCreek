ALTER TABLE [dbo].[mc_accesslevel]
    ADD CONSTRAINT [DF_mc_accesslevel_Role] DEFAULT (N'') FOR [Role];

