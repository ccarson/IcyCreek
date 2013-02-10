ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_bMaintenance] DEFAULT ((0)) FOR [bMaintenance];

