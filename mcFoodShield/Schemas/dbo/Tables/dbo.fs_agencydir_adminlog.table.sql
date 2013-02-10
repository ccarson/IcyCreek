CREATE TABLE [dbo].[fs_agencydir_adminlog] (
    [id]                    INT            IDENTITY (6, 1) NOT NULL,
    [agency_id]             INT            NOT NULL,
    [main_admin_id]         INT            NOT NULL,
    [main_update_date]      DATETIME2 (0)  NULL,
    [main_notes]            NVARCHAR (MAX) NULL,
    [personnel_admin_id]    INT            NOT NULL,
    [personnel_update_date] DATETIME2 (0)  NULL,
    [personnel_notes]       NVARCHAR (MAX) NULL,
    [structure_admin_id]    INT            NOT NULL,
    [structure_update_date] DATETIME2 (0)  NULL,
    [structure_notes]       NVARCHAR (MAX) NULL
);

