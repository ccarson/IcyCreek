ALTER TABLE [dbo].[p_results]
    ADD CONSTRAINT [DF_p_results_question_id] DEFAULT ('0') FOR [question_id];

