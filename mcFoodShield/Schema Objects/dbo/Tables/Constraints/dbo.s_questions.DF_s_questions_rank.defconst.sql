ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_rank] DEFAULT ('0') FOR [rank];

