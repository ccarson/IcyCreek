ALTER TABLE [dbo].[vfc_file_status]
    ADD CONSTRAINT [DF_vfc_file_status_active] DEFAULT ((0)) FOR [active];

