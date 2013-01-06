ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_active] DEFAULT ((1)) FOR [active];

