ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_createdBy] DEFAULT (N'') FOR [createdBy];

