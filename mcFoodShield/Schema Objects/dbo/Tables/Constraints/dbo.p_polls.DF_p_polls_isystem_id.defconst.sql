ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_isystem_id] DEFAULT ('0') FOR [isystem_id];

