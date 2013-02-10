ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_courseName] DEFAULT (N'') FOR [courseName];

