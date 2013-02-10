ALTER TABLE [dbo].[large_file_user]
    ADD CONSTRAINT [DF_large_file_user_clickedDownload] DEFAULT ((0)) FOR [clickedDownload];

