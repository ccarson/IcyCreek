ALTER TABLE [dbo].[conf_questions_custom]
    ADD CONSTRAINT [DF_conf_questions_custom_has_subquestion] DEFAULT ((0)) FOR [has_subquestion];

