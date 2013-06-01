ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_numQuestions] DEFAULT ('0') FOR [numQuestions];

