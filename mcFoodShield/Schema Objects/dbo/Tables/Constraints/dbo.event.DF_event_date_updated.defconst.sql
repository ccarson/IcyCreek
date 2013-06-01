ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_date_updated] DEFAULT (getdate()) FOR [date_updated];

