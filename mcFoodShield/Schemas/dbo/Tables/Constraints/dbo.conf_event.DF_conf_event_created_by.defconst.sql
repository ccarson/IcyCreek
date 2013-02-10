ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_created_by] DEFAULT ('0') FOR [created_by];

