ALTER TABLE [dbo].[large_file_upload_utility]
    ADD CONSTRAINT [PK_large_file_upload_utility_id] PRIMARY KEY CLUSTERED ([id] ASC, [uniqueFileId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

