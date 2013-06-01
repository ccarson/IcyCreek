ALTER TABLE [dbo].[p_results]
    ADD CONSTRAINT [DF_p_results_answer_id] DEFAULT ('0') FOR [answer_id];

