ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_connectID] DEFAULT ('0') FOR [connectID];

