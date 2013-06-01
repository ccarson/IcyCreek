ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_updated_by] DEFAULT ('0') FOR [updated_by];

