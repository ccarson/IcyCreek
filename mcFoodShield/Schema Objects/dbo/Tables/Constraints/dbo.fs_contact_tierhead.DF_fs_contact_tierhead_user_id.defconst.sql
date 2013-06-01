ALTER TABLE [dbo].[fs_contact_tierhead]
    ADD CONSTRAINT [DF_fs_contact_tierhead_user_id] DEFAULT ('0') FOR [user_id];

