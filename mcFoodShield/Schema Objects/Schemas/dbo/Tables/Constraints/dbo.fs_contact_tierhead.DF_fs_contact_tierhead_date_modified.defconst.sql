ALTER TABLE [dbo].[fs_contact_tierhead]
    ADD CONSTRAINT [DF_fs_contact_tierhead_date_modified] DEFAULT (NULL) FOR [date_modified];

