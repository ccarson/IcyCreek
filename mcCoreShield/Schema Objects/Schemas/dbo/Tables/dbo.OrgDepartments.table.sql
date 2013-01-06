CREATE TABLE [dbo].[OrgDepartments] (
    [id]                  UNIQUEIDENTIFIER NOT NULL,
    [name]                NVARCHAR (270)   NULL,
    [organizationsID]     UNIQUEIDENTIFIER NOT NULL,
    [orgLocationsID]      UNIQUEIDENTIFIER NOT NULL,
    [parentDepartmentsID] UNIQUEIDENTIFIER NULL,
    [org_level]           INT              NULL,
    [active]              BIT              NULL,
    [notes]               NVARCHAR (MAX)   NULL,
    [website]             NVARCHAR (MAX)   NULL,
    [date_added]          DATETIME2 (0)    NULL,
    [added_by]            UNIQUEIDENTIFIER NULL,
    [date_updated]        DATETIME2 (0)    NULL,
    [updated_by]          UNIQUEIDENTIFIER NULL,
    [newRecord]           TINYINT          NULL
);

