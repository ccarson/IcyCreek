ALTER TABLE [dbo].[lic_license]
    ADD CONSTRAINT [DF_lic_license_UserID] DEFAULT (NULL) FOR [UserID];

