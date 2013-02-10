ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_isystem_id] DEFAULT ('0') FOR [isystem_id];

