ALTER TABLE [dbo].[large_file_upload_utility]
    ADD CONSTRAINT [DF_large_file_upload_utility_group_id] DEFAULT ('0') FOR [group_id];

