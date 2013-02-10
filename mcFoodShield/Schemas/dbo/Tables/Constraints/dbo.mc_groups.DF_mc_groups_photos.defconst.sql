ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_photos] DEFAULT ((0)) FOR [photos];

