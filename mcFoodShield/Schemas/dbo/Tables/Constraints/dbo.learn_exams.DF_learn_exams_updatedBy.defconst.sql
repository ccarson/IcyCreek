ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [DF_learn_exams_updatedBy] DEFAULT (NULL) FOR [updatedBy];

