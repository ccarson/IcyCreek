ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_wiki] DEFAULT ('0') FOR [wiki];

