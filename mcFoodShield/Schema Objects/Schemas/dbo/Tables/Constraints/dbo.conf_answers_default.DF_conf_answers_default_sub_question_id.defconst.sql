ALTER TABLE [dbo].[conf_answers_default]
    ADD CONSTRAINT [DF_conf_answers_default_sub_question_id] DEFAULT ('0') FOR [sub_question_id];

