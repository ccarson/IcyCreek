ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_PIN] DEFAULT ((0)) FOR [PIN];

