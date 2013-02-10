ALTER TABLE [dbo].[p_questions]
    ADD CONSTRAINT [DF_p_questions_poll_id] DEFAULT ('0') FOR [poll_id];

