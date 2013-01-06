ALTER TABLE [dbo].[large_file_upload_utility]
    ADD CONSTRAINT [DF_large_file_upload_utility_active] DEFAULT ('1') FOR [active];

