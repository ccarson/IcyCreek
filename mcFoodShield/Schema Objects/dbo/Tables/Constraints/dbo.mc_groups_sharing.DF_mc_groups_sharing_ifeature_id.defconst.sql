ALTER TABLE [dbo].[mc_groups_sharing]
    ADD CONSTRAINT [DF_mc_groups_sharing_ifeature_id] DEFAULT ('0') FOR [ifeature_id];

