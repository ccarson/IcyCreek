ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_group_id] DEFAULT ('0') FOR [group_id];

