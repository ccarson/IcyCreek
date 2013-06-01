ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_examID] DEFAULT (N'') FOR [examID];

