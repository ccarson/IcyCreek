ALTER TABLE [dbo].[vfc_file_tags]
    ADD CONSTRAINT [DF_vfc_file_tags_CreatedBy] DEFAULT ('0') FOR [CreatedBy];

