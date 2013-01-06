ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_Term_ID] DEFAULT ('0') FOR [Term_ID];

