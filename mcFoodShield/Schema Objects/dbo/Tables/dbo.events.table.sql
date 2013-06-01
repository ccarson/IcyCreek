CREATE TABLE [dbo].[events] (
    [id]        NVARCHAR (200) NOT NULL,
    [title]     NVARCHAR (400) NOT NULL,
    [body]      NVARCHAR (MAX) NULL,
    [starttime] DATETIME2 (0)  NOT NULL,
    [endtime]   DATETIME2 (0)  NOT NULL,
    [userid]    NVARCHAR (200) NULL
);

