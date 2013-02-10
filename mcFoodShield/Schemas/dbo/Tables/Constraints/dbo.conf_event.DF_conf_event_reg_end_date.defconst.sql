ALTER TABLE [dbo].[conf_event]
    ADD CONSTRAINT [DF_conf_event_reg_end_date] DEFAULT (NULL) FOR [reg_end_date];

