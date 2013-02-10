ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_publichomepage] DEFAULT ('0') FOR [publichomepage];

