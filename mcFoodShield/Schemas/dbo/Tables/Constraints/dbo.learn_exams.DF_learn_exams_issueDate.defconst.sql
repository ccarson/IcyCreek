ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_issueDate] DEFAULT (NULL) FOR [issueDate];

