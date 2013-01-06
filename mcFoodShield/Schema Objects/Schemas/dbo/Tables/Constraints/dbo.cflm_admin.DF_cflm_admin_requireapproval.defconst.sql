ALTER TABLE [dbo].[cflm_admin]
    ADD CONSTRAINT [DF_cflm_admin_requireapproval] DEFAULT ('0') FOR [requireapproval];

