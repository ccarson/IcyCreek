ALTER TABLE [dbo].[large_file_upload_utility]
    ADD CONSTRAINT [DF_large_file_upload_utility_requirelogin] DEFAULT ((0)) FOR [requirelogin];

