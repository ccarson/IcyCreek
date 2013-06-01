ALTER TABLE [dbo].[learn_regquestions]
    ADD CONSTRAINT [DF_learn_regquestions_questionTypeID] DEFAULT ('0') FOR [questionTypeID];

