ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_courseID] DEFAULT (N'') FOR [courseID];

