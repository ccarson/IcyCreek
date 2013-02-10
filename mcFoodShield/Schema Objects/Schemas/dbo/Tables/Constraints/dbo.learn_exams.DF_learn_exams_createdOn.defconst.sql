ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_createdOn] DEFAULT (NULL) FOR [createdOn];

