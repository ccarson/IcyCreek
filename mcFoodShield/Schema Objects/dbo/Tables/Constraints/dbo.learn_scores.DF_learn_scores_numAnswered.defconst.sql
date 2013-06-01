ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_numAnswered] DEFAULT ('0') FOR [numAnswered];

