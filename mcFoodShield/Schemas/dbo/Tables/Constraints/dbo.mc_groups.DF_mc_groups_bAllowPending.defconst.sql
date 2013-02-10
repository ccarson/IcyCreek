ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_bAllowPending] DEFAULT ((0)) FOR [bAllowPending];

