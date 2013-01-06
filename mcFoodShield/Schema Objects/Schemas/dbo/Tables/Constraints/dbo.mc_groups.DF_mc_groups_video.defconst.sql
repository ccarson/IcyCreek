ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_video] DEFAULT ((0)) FOR [video];

