ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_notification_subject] DEFAULT (NULL) FOR [notification_subject];

