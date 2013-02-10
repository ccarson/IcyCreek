ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_resultmailto] DEFAULT (N'') FOR [resultmailto];

