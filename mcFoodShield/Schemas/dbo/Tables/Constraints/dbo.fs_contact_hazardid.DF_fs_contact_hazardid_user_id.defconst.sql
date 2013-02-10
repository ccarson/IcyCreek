ALTER TABLE [dbo].[fs_contact_hazardid]
    ADD CONSTRAINT [DF_fs_contact_hazardid_user_id] DEFAULT ('0') FOR [user_id];

