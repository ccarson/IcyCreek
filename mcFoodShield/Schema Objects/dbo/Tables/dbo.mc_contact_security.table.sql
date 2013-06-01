CREATE TABLE [dbo].[mc_contact_security] (
    [id]             UNIQUEIDENTIFIER NULL,
    [userID]         INT              NOT NULL,
    [accessID]       INT              NULL,
    [expires]        DATETIME         NULL,
    [hits]           INT              NULL,
    [LastLogin]      DATETIME         NULL,
    [dateJoined]     DATETIME         NULL,
    [datemodified]   DATETIME         NULL,
    [memberType]     INT              NULL,
    [sysmember]      INT              NULL,
    [hidden]         BIT              NULL,
    [folder_id]      INT              NULL,
    [status]         NVARCHAR (20)    NULL,
    [security_level] INT              NULL,
    PRIMARY KEY CLUSTERED ([userID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

