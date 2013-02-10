ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_name] DEFAULT ('') FOR [name];

