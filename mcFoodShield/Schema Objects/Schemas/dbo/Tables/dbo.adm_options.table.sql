CREATE TABLE [dbo].[adm_options] (
    [id]           INT             IDENTITY (2, 1) NOT NULL,
    [tos]          NVARCHAR (MAX)  NULL,
    [policy]       NVARCHAR (MAX)  NULL,
    [maintenance]  BIT             NOT NULL,
    [maint_access] NVARCHAR (25)   NULL,
    [q1]           NVARCHAR (50)   NULL,
    [q2]           NVARCHAR (50)   NULL,
    [q3]           NVARCHAR (50)   NULL,
    [register]     BIT             NOT NULL,
    [image]        VARBINARY (MAX) NULL,
    [PIN]          INT             NULL,
    [emailExpires] INT             NOT NULL,
    [pagination]   INT             NOT NULL,
    [isystem_id]   INT             NOT NULL
);

