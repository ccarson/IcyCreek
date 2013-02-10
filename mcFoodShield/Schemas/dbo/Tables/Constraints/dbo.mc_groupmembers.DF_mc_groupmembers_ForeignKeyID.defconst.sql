ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_ForeignKeyID] DEFAULT ('0') FOR [ForeignKeyID];

