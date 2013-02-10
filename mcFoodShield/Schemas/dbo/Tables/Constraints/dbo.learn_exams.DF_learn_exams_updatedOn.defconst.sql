ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_updatedOn] DEFAULT (getdate()) FOR [updatedOn];

