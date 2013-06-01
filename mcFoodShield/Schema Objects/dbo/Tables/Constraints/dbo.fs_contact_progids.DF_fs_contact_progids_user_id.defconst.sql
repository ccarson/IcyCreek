ALTER TABLE [dbo].[fs_contact_progids]
    ADD CONSTRAINT [DF_fs_contact_progids_user_id] DEFAULT ('0') FOR [user_id];

