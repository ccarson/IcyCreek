ALTER TABLE [dbo].[conf_questions_custom]
    ADD CONSTRAINT [DF_conf_questions_custom_active] DEFAULT ((1)) FOR [active];

