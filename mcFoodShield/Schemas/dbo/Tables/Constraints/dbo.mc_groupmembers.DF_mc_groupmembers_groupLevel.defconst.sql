ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_groupLevel] DEFAULT ('0') FOR [groupLevel];

