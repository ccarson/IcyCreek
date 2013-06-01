ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_regEndDate] DEFAULT (NULL) FOR [regEndDate];

