CREATE TABLE [dbo].[alert_maintenance] (
    [alert_MaintenanceID] INT            IDENTITY (6, 1) NOT NULL,
    [alert_MaintDate]     DATETIME2 (0)  NULL,
    [alert_Purpose]       NVARCHAR (350) NULL,
    [alert_Duration]      NVARCHAR (150) NULL,
    [alert_SmDesc]        NVARCHAR (100) NULL,
    [alert_MaintStart]    DATETIME2 (0)  NULL,
    [alert_MaintEnd]      DATETIME2 (0)  NULL,
    [alert_Affected]      NVARCHAR (150) NULL,
    [alert_TimeStart]     NVARCHAR (20)  NULL,
    [alert_TimeEnd]       NVARCHAR (20)  NULL
);

