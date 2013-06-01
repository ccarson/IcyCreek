ALTER TABLE [dbo].[fs_contact_labids]
    ADD CONSTRAINT [DF_fs_contact_labids_user_id] DEFAULT ('0') FOR [user_id];

