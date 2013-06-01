CREATE TABLE [dbo].[tblmember] (
    [memberId]  INT          IDENTITY (9, 1) NOT NULL,
    [groupId]   INT          NOT NULL,
    [firstName] VARCHAR (25) NOT NULL,
    [lastName]  VARCHAR (25) NOT NULL
);

