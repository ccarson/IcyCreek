CREATE TABLE [dbo].[methodsStepsActionsComments] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [methodsID]   INT            NULL,
    [stepsID]     INT            NULL,
    [actionsID]   INT            NULL,
    [userID]      INT            NOT NULL,
    [commentDate] DATETIME2 (7)  NOT NULL,
    [comment]     NVARCHAR (500) NOT NULL
);

