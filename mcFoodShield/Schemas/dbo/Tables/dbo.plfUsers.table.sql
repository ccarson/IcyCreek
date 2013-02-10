CREATE TABLE [dbo].[plfUsers] (
    [userId]           INT            IDENTITY (1, 1) NOT NULL,
    [userFirstName]    NVARCHAR (100) NULL,
    [userLastName]     NVARCHAR (100) NULL,
    [userEmailAddress] NVARCHAR (150) NULL,
    [userLoginName]    NVARCHAR (100) NULL,
    [userPassword]     NVARCHAR (100) NULL,
    [userIsAdmin]      NVARCHAR (50)  NULL,
    CHECK ([userIsAdmin]='YES' OR [userIsAdmin]='NO')
);

