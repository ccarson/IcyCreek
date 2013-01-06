CREATE TABLE [dbo].[preso_groupmemberships] (
    [id]         INT           NULL,
    [updatedOn]  DATETIME2 (7) NULL,
    [createdOn]  DATETIME2 (7) NULL,
    [isOwner]    BIT           NULL,
    [isApproved] BIT           NULL,
    [groupID]    INT           NULL,
    [userID]     INT           NULL
);

