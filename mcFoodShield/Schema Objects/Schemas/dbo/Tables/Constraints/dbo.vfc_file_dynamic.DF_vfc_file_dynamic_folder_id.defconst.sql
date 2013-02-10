ALTER TABLE [dbo].[vfc_file_dynamic]
    ADD CONSTRAINT [DF_vfc_file_dynamic_folder_id] DEFAULT ('0') FOR [folder_id];

