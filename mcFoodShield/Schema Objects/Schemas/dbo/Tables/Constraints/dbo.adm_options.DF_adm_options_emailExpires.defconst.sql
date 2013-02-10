ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_emailExpires] DEFAULT ('0') FOR [emailExpires];

