ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_created_date] DEFAULT (NULL) FOR [created_date];

