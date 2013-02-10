ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_IsDemo] DEFAULT ((0)) FOR [IsDemo];

