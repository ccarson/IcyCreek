ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_updatedOn] DEFAULT (getdate()) FOR [updatedOn];

