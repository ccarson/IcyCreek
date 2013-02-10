ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_questionTypeID] DEFAULT ('0') FOR [questionTypeID];

