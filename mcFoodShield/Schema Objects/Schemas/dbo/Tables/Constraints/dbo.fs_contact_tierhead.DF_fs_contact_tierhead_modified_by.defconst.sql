ALTER TABLE [dbo].[fs_contact_tierhead]
    ADD CONSTRAINT [DF_fs_contact_tierhead_modified_by] DEFAULT ('0') FOR [modified_by];

