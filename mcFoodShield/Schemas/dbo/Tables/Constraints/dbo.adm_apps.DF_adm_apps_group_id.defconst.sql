ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_group_id] DEFAULT ((0)) FOR [group_id];

