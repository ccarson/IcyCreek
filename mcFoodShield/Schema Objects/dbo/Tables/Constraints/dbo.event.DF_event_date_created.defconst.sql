ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_date_created] DEFAULT (getdate()) FOR [date_created];

