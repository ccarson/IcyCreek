ALTER TABLE [dbo].[conf_aphis]
    ADD CONSTRAINT [DF_conf_aphis_event_id] DEFAULT ('0') FOR [event_id];

