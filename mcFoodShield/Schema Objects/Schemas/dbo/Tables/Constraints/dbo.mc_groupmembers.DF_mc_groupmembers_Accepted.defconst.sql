ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_Accepted] DEFAULT ('0') FOR [Accepted];

