ALTER TABLE [dbo].[conf_venue]
    ADD CONSTRAINT [DF_conf_venue_event_id] DEFAULT ('0') FOR [event_id];

