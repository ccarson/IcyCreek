ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_user_id] DEFAULT ('0') FOR [user_id];

