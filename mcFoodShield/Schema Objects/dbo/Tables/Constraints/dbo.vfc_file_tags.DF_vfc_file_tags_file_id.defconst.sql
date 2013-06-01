ALTER TABLE [dbo].[vfc_file_tags]
    ADD CONSTRAINT [DF_vfc_file_tags_file_id] DEFAULT ('0') FOR [file_id];

