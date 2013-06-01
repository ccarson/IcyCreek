ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_examID] DEFAULT (N'') FOR [examID];

