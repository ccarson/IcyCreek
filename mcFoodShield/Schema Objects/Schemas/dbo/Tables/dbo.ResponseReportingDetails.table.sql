CREATE TABLE [dbo].[ResponseReportingDetails] (
    [id]              UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [responseid]      UNIQUEIDENTIFIER NULL,
    [state]           NVARCHAR (50)    NULL,
    [percentile]      NVARCHAR (50)    NULL,
    [percentChange]   NVARCHAR (50)    NULL,
    [strength]        NVARCHAR (100)   NULL,
    [opportunity]     NVARCHAR (100)   NULL,
    [suggestion1]     NVARCHAR (500)   NULL,
    [suggestion2]     NVARCHAR (500)   NULL,
    [suggestion3]     NVARCHAR (500)   NULL,
    [description1]    NVARCHAR (500)   NULL,
    [description2]    NVARCHAR (500)   NULL,
    [bActive]         BIT              NULL,
    [bResponseLocked] BIT              DEFAULT ((0)) NULL,
    [groupID]         INT              NULL
);

