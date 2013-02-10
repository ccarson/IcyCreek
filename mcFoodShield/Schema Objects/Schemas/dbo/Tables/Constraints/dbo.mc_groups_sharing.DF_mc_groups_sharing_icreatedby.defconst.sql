ALTER TABLE [dbo].[mc_groups_sharing]
    ADD CONSTRAINT [DF_mc_groups_sharing_icreatedby] DEFAULT ('0') FOR [icreatedby];

