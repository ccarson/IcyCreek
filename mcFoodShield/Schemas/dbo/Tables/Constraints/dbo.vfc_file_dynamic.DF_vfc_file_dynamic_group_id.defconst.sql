ALTER TABLE [dbo].[vfc_file_dynamic]
    ADD CONSTRAINT [DF_vfc_file_dynamic_group_id] DEFAULT ('0') FOR [group_id];

