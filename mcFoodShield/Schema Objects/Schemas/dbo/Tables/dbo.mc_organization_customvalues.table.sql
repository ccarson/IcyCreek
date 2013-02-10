CREATE TABLE [dbo].[mc_organization_customvalues] (
    [id]          INT           IDENTITY (19, 1) NOT NULL,
    [field_id]    INT           NOT NULL,
    [org_id]      INT           NOT NULL,
    [field_value] NVARCHAR (50) NOT NULL
);

