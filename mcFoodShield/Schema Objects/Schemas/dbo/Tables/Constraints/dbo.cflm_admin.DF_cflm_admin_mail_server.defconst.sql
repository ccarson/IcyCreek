ALTER TABLE [dbo].[cflm_admin]
    ADD CONSTRAINT [DF_cflm_admin_mail_server] DEFAULT (N'') FOR [mail_server];

