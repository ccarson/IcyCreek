ALTER TABLE [dbo].[p_questions]
    ADD CONSTRAINT [DF_p_questions_active] DEFAULT ((0)) FOR [active];

