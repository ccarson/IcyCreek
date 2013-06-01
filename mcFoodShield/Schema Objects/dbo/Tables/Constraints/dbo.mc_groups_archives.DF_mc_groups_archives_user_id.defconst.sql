ALTER TABLE [dbo].[mc_groups_archives]
    ADD CONSTRAINT [DF_mc_groups_archives_user_id] DEFAULT ('0') FOR [user_id];

