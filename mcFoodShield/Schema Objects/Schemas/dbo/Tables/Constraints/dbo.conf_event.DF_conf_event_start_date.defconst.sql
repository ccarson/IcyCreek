ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_start_date] DEFAULT (NULL) FOR [start_date];

