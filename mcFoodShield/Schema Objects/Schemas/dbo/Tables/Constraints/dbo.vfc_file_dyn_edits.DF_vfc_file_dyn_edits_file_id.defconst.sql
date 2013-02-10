ALTER TABLE [dbo].[vfc_file_dyn_edits]
    ADD CONSTRAINT [DF_vfc_file_dyn_edits_file_id] DEFAULT ('0') FOR [file_id];

