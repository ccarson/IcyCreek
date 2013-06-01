ALTER TABLE [dbo].[adm_apps_options]
    ADD CONSTRAINT [DF_adm_apps_options_optionname] DEFAULT (N'') FOR [optionname];

