ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_group_id] DEFAULT ('0') FOR [group_id];

