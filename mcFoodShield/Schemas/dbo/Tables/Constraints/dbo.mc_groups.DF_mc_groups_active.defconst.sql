ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_active] DEFAULT ((0)) FOR [active];

