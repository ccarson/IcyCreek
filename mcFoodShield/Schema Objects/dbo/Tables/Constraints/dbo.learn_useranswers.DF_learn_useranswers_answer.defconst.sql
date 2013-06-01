ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_answer] DEFAULT (NULL) FOR [answer];

