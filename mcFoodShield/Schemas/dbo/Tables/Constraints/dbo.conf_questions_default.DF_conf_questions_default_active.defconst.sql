ALTER TABLE [dbo].[conf_questions_default]
    ADD CONSTRAINT [DF_conf_questions_default_active] DEFAULT ((1)) FOR [active];

