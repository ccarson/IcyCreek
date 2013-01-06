ALTER TABLE [dbo].[conf_questions_default]
    ADD CONSTRAINT [DF_conf_questions_default_has_subquestion] DEFAULT ((0)) FOR [has_subquestion];

