ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_isystem_id] DEFAULT ('0') FOR [isystem_id];

