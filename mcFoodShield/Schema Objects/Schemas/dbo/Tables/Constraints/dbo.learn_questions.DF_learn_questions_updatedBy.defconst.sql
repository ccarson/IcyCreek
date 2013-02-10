ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_updatedBy] DEFAULT (NULL) FOR [updatedBy];

