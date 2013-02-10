ALTER TABLE [dbo].[mc_groups_sharedfeatures]
    ADD CONSTRAINT [DF_mc_groups_sharedfeatures_ifeature_id] DEFAULT ('0') FOR [ifeature_id];

