ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_brandingEnabled] DEFAULT ((0)) FOR [brandingEnabled];

