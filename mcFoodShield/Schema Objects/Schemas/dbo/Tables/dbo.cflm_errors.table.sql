CREATE TABLE [dbo].[cflm_errors] (
    [errorid]     FLOAT          NOT NULL,
    [typeoferror] NVARCHAR (50)  NULL,
    [error]       NVARCHAR (MAX) NULL,
    [reporter]    FLOAT          NULL,
    [resolved]    FLOAT          NOT NULL,
    [linkid]      FLOAT          NULL
);

