ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_register] DEFAULT ((0)) FOR [register];

