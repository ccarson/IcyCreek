ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_CreatedByUserID] DEFAULT ('0') FOR [CreatedByUserID];

