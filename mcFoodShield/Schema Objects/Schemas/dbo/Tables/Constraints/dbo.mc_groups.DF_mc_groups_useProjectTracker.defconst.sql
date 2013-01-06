ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_useProjectTracker] DEFAULT ((0)) FOR [useProjectTracker];

