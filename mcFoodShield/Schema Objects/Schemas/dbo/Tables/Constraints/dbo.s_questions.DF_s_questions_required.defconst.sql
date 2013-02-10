ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_required] DEFAULT ((0)) FOR [required];

