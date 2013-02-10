ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_homepage] DEFAULT ('0') FOR [homepage];

