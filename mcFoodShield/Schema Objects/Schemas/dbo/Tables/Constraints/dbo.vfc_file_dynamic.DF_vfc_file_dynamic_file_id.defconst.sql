ALTER TABLE [dbo].[vfc_file_dynamic]
    ADD CONSTRAINT [DF_vfc_file_dynamic_file_id] DEFAULT ('0') FOR [file_id];

