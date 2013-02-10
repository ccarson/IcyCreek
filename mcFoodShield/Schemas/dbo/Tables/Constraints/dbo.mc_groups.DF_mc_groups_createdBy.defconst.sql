ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_createdBy] DEFAULT ('0') FOR [createdBy];

