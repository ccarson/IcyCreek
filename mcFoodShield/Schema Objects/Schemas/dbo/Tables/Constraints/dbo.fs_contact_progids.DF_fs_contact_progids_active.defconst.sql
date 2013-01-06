ALTER TABLE [dbo].[fs_contact_progids]
    ADD CONSTRAINT [DF_fs_contact_progids_active] DEFAULT ((0)) FOR [active];

