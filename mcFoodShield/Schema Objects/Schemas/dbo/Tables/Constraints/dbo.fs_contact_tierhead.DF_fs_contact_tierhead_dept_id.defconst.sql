ALTER TABLE [dbo].[fs_contact_tierhead]
    ADD CONSTRAINT [DF_fs_contact_tierhead_dept_id] DEFAULT ('0') FOR [dept_id];

