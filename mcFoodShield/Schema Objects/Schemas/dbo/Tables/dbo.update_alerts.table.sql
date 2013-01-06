CREATE TABLE [dbo].[update_alerts] (
    [update_AlertID]       INT            IDENTITY (2, 1) NOT NULL,
    [update_AlertName]     NVARCHAR (200) NULL,
    [update_AlertDate]     DATETIME2 (0)  NULL,
    [update_DefectID]      NVARCHAR (50)  NULL,
    [update_AlertType]     NVARCHAR (50)  NULL,
    [update_AlertRelease]  NVARCHAR (20)  NULL,
    [update_AlertAffected] NVARCHAR (50)  NULL
);

