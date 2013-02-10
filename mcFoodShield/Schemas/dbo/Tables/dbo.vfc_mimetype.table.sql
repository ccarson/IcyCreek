CREATE TABLE [dbo].[vfc_mimetype] (
    [ID]             INT            IDENTITY (38, 1) NOT NULL,
    [sFriendlyName]  NVARCHAR (MAX) NULL,
    [sTypeName]      NVARCHAR (MAX) NOT NULL,
    [sFileExtension] NVARCHAR (128) NULL,
    [sDescription]   NVARCHAR (MAX) NULL,
    [bAllow]         BIT            NOT NULL,
    [bAllowConvert]  BIT            NOT NULL,
    [sImage]         NVARCHAR (100) NULL,
    [iType]          INT            NOT NULL,
    [bAllowEncrypt]  BIT            NOT NULL
);

