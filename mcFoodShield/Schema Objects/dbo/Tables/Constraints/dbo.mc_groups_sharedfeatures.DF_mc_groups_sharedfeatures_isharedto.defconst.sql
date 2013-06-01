ALTER TABLE [dbo].[mc_groups_sharedfeatures]
    ADD CONSTRAINT [DF_mc_groups_sharedfeatures_isharedto] DEFAULT ('0') FOR [isharedto];

