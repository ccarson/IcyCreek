ALTER TABLE [dbo].[vfc_file_dyn_edits]
    ADD CONSTRAINT [DF_vfc_file_dyn_edits_user_id] DEFAULT ('0') FOR [user_id];

