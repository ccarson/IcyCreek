ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_courseDescription] DEFAULT (N'') FOR [courseDescription];

