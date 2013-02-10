ALTER TABLE [dbo].[mtsch_poll]
    ADD CONSTRAINT [DF_mtsch_poll_mtsch_group_id] DEFAULT ('0') FOR [mtsch_group_id];

