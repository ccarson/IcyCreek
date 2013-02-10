ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_courseID] DEFAULT (N'') FOR [courseID];

