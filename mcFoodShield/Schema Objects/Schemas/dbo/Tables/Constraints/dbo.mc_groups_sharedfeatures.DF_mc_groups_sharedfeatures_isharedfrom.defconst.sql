ALTER TABLE [dbo].[mc_groups_sharedfeatures]
    ADD CONSTRAINT [DF_mc_groups_sharedfeatures_isharedfrom] DEFAULT ('0') FOR [isharedfrom];

