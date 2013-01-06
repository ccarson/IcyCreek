CREATE TABLE [dbo].[mc_sys_alerts] (
    [maint_id]   INT           IDENTITY (2, 1) NOT NULL,
    [maint_text] VARCHAR (150) NULL,
    [expires]    DATETIME2 (0) NULL,
    [active]     BIT           NULL
);

