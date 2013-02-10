ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_owner] DEFAULT ('0') FOR [owner];

