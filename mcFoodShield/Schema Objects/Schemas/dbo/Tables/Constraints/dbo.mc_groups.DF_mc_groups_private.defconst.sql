ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_private] DEFAULT ((0)) FOR [private];

