ALTER TABLE [dbo].[mc_groups_peergroup]
    ADD CONSTRAINT [DF_mc_groups_peergroup_createdby] DEFAULT ('0') FOR [createdby];

