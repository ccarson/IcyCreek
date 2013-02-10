ALTER TABLE [dbo].[cflm_admin]
    ADD CONSTRAINT [DF_cflm_admin_admin_email] DEFAULT (N'') FOR [admin_email];

