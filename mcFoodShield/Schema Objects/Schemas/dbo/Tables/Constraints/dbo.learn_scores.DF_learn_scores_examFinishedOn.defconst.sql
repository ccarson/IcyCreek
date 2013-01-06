ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_examFinishedOn] DEFAULT (NULL) FOR [examFinishedOn];

