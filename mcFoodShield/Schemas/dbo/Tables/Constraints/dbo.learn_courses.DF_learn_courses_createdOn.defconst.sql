ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_createdOn] DEFAULT (getdate()) FOR [createdOn];

