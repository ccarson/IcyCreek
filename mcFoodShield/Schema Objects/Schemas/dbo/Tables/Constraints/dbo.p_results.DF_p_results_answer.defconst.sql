ALTER TABLE [dbo].[p_results]
    ADD CONSTRAINT [DF_p_results_answer] DEFAULT (N'') FOR [answer];

