ALTER TABLE [dbo].[fs_contact_tierhead]
    ADD CONSTRAINT [DF_fs_contact_tierhead_added_by] DEFAULT ('0') FOR [added_by];

