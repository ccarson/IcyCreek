ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_polls] DEFAULT ((0)) FOR [polls];

