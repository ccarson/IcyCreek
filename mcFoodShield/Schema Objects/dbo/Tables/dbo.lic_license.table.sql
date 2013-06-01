CREATE TABLE [dbo].[lic_license] (
    [lic_LicenseID]    INT            IDENTITY (2, 1) NOT NULL,
    [lic_SoftwareName] NVARCHAR (150) NULL,
    [lic_License]      NVARCHAR (100) NULL,
    [lic_Additional]   NVARCHAR (100) NULL,
    [lic_UserName]     NVARCHAR (100) NULL,
    [lic_ExpireDate]   DATETIME2 (0)  NULL,
    [lic_DateObtained] DATETIME2 (0)  NULL,
    [lic_LicenseType]  NVARCHAR (100) NULL,
    [lic_Vendor]       NVARCHAR (100) NULL,
    [lic_Description]  NVARCHAR (MAX) NULL,
    [UserID]           INT            NULL
);

