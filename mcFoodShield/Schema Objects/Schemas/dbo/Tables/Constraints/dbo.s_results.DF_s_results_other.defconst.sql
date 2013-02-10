ALTER TABLE [dbo].[s_results]
    ADD CONSTRAINT [DF_s_results_other] DEFAULT (N'') FOR [other];

