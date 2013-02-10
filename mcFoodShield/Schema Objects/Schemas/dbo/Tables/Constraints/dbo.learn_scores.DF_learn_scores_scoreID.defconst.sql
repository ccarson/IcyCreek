ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_scoreID] DEFAULT (N'') FOR [scoreID];

