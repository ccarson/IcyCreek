ALTER TABLE [dbo].[large_file_email]
    ADD CONSTRAINT [DF_large_file_email_viewedPage] DEFAULT ((0)) FOR [viewedPage];

