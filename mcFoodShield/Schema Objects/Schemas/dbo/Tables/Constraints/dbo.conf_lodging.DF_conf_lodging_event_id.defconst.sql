ALTER TABLE [dbo].[conf_lodging]
    ADD CONSTRAINT [DF_conf_lodging_event_id] DEFAULT ('0') FOR [event_id];

