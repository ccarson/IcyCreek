ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_pagination] DEFAULT ('0') FOR [pagination];

