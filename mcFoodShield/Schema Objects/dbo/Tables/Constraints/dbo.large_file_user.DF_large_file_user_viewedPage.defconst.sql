ALTER TABLE [dbo].[large_file_user]
    ADD CONSTRAINT [DF_large_file_user_viewedPage] DEFAULT ((0)) FOR [viewedPage];

