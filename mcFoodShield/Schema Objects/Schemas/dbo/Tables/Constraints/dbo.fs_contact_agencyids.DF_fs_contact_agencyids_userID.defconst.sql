ALTER TABLE [dbo].[fs_contact_agencyids]
    ADD CONSTRAINT [DF_fs_contact_agencyids_userID] DEFAULT ('0') FOR [userID];

