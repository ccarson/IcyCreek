ALTER TABLE [dbo].[large_file_email]
    ADD CONSTRAINT [DF_large_file_email_viewedPageDate] DEFAULT (NULL) FOR [viewedPageDate];

