ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_examID] DEFAULT (N'') FOR [examID];

