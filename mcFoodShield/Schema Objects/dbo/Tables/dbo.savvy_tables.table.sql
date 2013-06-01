CREATE TABLE [dbo].[savvy_tables] (
    [id]           INT            IDENTITY (24, 1) NOT NULL,
    [iKB_id]       INT            NOT NULL,
    [iLinkCat_id]  INT            NOT NULL,
    [iDoc_id]      INT            NOT NULL,
    [sPage_Name]   NVARCHAR (255) NOT NULL,
    [iCreatedBy]   INT            NOT NULL,
    [dCreatedOn]   DATETIME2 (0)  NULL,
    [sTableHeader] NVARCHAR (50)  NULL,
    [iDisplay]     INT            NOT NULL,
    [sSort]        NVARCHAR (20)  NULL,
    [multiDoc_id]  NVARCHAR (100) NULL,
    [multiLink_id] NVARCHAR (200) NULL,
    [bShow_ID]     BIT            NOT NULL,
    [iNameWidth]   INT            NOT NULL,
    [iCatWidth]    INT            NOT NULL,
    [iLinkWidth]   INT            NOT NULL,
    [sSortColumn]  NVARCHAR (20)  NOT NULL
);

