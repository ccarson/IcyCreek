ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_dueDate] DEFAULT (NULL) FOR [dueDate];

