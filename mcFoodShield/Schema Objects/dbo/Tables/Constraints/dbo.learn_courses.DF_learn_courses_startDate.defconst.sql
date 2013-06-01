ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_startDate] DEFAULT (NULL) FOR [startDate];

