ALTER TABLE [dbo].[conf_answers_custom]
    ADD CONSTRAINT [DF_conf_answers_custom_sub_question_id] DEFAULT ('0') FOR [sub_question_id];

