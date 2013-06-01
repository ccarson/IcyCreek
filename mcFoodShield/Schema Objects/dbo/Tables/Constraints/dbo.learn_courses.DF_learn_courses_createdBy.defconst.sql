ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [DF_learn_courses_createdBy] DEFAULT (N'') FOR [createdBy];

