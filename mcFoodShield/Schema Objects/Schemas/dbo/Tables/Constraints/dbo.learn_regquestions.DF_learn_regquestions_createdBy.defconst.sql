ALTER TABLE [dbo].[learn_regquestions]
    ADD CONSTRAINT [DF_learn_regquestions_createdBy] DEFAULT (N'') FOR [createdBy];

