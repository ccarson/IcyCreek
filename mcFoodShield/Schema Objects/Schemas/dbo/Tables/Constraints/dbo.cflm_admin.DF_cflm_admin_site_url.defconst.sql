ALTER TABLE [dbo].[cflm_admin]
    ADD CONSTRAINT [DF_cflm_admin_site_url] DEFAULT (N'') FOR [site_url];

