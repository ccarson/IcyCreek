ALTER TABLE [dbo].[mc_groups_archives]
    ADD CONSTRAINT [DF_mc_groups_archives_message_id] DEFAULT ('0') FOR [message_id];

