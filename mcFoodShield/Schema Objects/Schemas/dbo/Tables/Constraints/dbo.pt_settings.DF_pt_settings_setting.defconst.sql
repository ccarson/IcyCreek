ALTER TABLE [dbo].[pt_settings]
    ADD CONSTRAINT [DF_pt_settings_setting] DEFAULT (NULL) FOR [setting];

