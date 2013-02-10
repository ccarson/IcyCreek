ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_group_id] DEFAULT ('0') FOR [group_id];

