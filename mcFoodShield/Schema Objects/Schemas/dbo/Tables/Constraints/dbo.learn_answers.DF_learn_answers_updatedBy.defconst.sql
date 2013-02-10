ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_updatedBy] DEFAULT (NULL) FOR [updatedBy];

