ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_surveys] DEFAULT ((0)) FOR [surveys];

