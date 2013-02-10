ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_updatedOn] DEFAULT (NULL) FOR [updatedOn];

