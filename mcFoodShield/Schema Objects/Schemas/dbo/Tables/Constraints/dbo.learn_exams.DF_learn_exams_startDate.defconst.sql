ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_startDate] DEFAULT (NULL) FOR [startDate];

