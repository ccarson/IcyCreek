ALTER TABLE [dbo].[learn_regquestions]
    ADD CONSTRAINT [DF_learn_regquestions_updatedOn] DEFAULT (getdate()) FOR [updatedOn];

