ALTER TABLE [dbo].[lic_license]
    ADD CONSTRAINT [DF_lic_license_lic_Vendor] DEFAULT (NULL) FOR [lic_Vendor];

