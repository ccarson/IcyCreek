ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_endDate] DEFAULT (NULL) FOR [endDate];

