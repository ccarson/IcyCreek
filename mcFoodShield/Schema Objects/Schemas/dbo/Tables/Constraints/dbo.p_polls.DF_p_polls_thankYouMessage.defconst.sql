ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_thankYouMessage] DEFAULT (N'') FOR [thankYouMessage];

