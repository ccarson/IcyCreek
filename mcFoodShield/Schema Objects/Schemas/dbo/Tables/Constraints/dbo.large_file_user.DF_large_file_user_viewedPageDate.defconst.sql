ALTER TABLE [dbo].[large_file_user]
    ADD CONSTRAINT [DF_large_file_user_viewedPageDate] DEFAULT (getdate()) FOR [viewedPageDate];

