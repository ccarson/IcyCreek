ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_date_ended] DEFAULT (NULL) FOR [date_ended];

