ALTER TABLE [dbo].[pt_settings]
    ADD CONSTRAINT [DF_pt_settings_settingValue] DEFAULT (NULL) FOR [settingValue];

