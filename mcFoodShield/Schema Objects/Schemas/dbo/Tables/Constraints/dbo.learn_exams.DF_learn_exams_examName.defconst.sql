ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_examName] DEFAULT (N'') FOR [examName];

