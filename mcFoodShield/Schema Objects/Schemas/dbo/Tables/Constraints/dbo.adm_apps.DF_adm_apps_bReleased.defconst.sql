ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_bReleased] DEFAULT ((1)) FOR [bReleased];

