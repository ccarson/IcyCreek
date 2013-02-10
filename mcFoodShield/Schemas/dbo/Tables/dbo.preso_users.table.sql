CREATE TABLE [dbo].[preso_users] (
    [id]                    INT            NULL,
    [lastLoggedInOn]        DATETIME2 (7)  NULL,
    [isSubscribed]          BIT            NULL,
    [isArchived]            BIT            NULL,
    [isVerified]            BIT            NULL,
    [dedicatedRoomPassword] NVARCHAR (200) NULL,
    [updatedOn]             DATETIME2 (7)  NULL,
    [pathToImageThumb]      NVARCHAR (200) NULL,
    [firstName]             NVARCHAR (200) NULL,
    [verifyKey]             NVARCHAR (200) NULL,
    [pathToImage]           NVARCHAR (200) NULL,
    [isAdmin]               BIT            NULL,
    [bio]                   NVARCHAR (200) NULL,
    [createdOn]             DATETIME2 (7)  NULL,
    [username]              NVARCHAR (200) NULL,
    [email]                 NVARCHAR (200) NULL,
    [password]              NVARCHAR (200) NULL,
    [lastName]              NVARCHAR (200) NULL
);

