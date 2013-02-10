ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_internalnews] DEFAULT ((1)) FOR [internalnews];

