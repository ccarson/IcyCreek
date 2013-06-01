ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_numAnsweredCorrect] DEFAULT ('0') FOR [numAnsweredCorrect];

