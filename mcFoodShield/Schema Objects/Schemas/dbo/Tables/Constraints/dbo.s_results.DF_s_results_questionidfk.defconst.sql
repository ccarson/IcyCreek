ALTER TABLE [dbo].[s_results]
    ADD CONSTRAINT [DF_s_results_questionidfk] DEFAULT (N'') FOR [questionidfk];

