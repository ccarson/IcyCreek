CREATE TABLE [dbo].[c_affiliation] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [sAffiliation] NVARCHAR (100) NOT NULL,
    [sLogoName]    NVARCHAR (100) NULL,
    [datecreated]  DATETIME       NULL,
    [iCreatedBy]   INT            NOT NULL,
    [bActive]      BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

