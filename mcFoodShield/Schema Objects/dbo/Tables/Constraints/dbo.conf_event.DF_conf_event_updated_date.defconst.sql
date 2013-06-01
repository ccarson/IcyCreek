ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_updated_date] DEFAULT (NULL) FOR [updated_date];

