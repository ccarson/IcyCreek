ALTER TABLE [dbo].[mtsch_poll]
    ADD CONSTRAINT [DF_mtsch_poll_status] DEFAULT ((1)) FOR [status];

