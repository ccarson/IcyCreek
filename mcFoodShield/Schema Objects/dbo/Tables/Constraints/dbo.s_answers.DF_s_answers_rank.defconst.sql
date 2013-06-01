ALTER TABLE [dbo].[s_answers]
    ADD CONSTRAINT [DF_s_answers_rank] DEFAULT ('0') FOR [rank];

