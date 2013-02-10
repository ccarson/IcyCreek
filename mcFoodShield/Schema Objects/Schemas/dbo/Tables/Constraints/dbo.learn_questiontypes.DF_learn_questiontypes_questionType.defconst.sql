ALTER TABLE [dbo].[learn_questiontypes]
    ADD CONSTRAINT [DF_learn_questiontypes_questionType] DEFAULT (N'') FOR [questionType];

