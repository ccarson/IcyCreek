CREATE TABLE [dbo].[conf_lodging] (
    [id]           INT            IDENTITY (3, 1) NOT NULL,
    [event_id]     INT            NOT NULL,
    [name]         NVARCHAR (255) NOT NULL,
    [phone]        NVARCHAR (15)  NOT NULL,
    [address1]     NVARCHAR (255) NOT NULL,
    [address2]     NVARCHAR (255) NULL,
    [city]         NVARCHAR (255) NOT NULL,
    [state]        NVARCHAR (2)   NOT NULL,
    [zip]          NVARCHAR (10)  NOT NULL,
    [other_info]   NVARCHAR (MAX) NULL,
    [created_by]   INT            NOT NULL,
    [created_date] DATETIME2 (0)  NULL,
    [updated_by]   INT            NOT NULL,
    [updated_date] DATETIME2 (0)  NULL
);

