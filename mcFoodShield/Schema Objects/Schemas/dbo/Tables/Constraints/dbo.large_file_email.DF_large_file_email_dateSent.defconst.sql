ALTER TABLE [dbo].[large_file_email]
    ADD CONSTRAINT [DF_large_file_email_dateSent] DEFAULT (getdate()) FOR [dateSent];

