ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_regStartDate] DEFAULT (NULL) FOR [regStartDate];

