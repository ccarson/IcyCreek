ALTER TABLE [dbo].[fs_contact_tierhead]
    ADD CONSTRAINT [DF_fs_contact_tierhead_org_id] DEFAULT ('0') FOR [org_id];

