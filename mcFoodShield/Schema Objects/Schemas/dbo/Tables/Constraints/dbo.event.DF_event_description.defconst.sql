ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_description] DEFAULT ('') FOR [description];

