ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_updatedByUserID] DEFAULT ('0') FOR [updatedByUserID];

