ALTER TABLE [dbo].[fs_contact_labids]
    ADD CONSTRAINT [DF_fs_contact_labids_Active] DEFAULT ((0)) FOR [Active];

