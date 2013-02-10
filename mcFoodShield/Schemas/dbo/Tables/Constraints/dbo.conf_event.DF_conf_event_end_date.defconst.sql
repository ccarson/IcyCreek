ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_end_date] DEFAULT (NULL) FOR [end_date];

