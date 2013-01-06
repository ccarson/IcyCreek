ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_PIN] DEFAULT ('0') FOR [PIN];

