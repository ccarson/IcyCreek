ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_examID] DEFAULT (N'') FOR [examID];

