ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_forum_id] DEFAULT (NULL) FOR [forum_id];

