ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_Role] DEFAULT ('0') FOR [Role];

