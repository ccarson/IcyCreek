ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_createdBy] DEFAULT (N'') FOR [createdBy];

