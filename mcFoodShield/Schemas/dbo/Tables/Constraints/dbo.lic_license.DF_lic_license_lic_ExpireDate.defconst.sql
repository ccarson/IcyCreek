ALTER TABLE [dbo].[lic_license]
    ADD CONSTRAINT [DF_lic_license_lic_ExpireDate] DEFAULT (NULL) FOR [lic_ExpireDate];

