ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_isystem_id] DEFAULT ('0') FOR [isystem_id];

