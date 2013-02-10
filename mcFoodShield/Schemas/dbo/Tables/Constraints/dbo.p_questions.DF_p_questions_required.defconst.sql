ALTER TABLE [dbo].[p_questions]
    ADD CONSTRAINT [DF_p_questions_required] DEFAULT ((0)) FOR [required];

