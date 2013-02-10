ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_maintenance] DEFAULT ((0)) FOR [maintenance];

