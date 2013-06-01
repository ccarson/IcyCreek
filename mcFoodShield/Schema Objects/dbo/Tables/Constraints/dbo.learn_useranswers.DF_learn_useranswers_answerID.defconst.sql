ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_answerID] DEFAULT (NULL) FOR [answerID];

