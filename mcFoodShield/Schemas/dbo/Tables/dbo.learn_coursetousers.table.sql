CREATE TABLE [dbo].[learn_coursetousers] (
    [courseToUserID] NCHAR (35)    NOT NULL,
    [courseID]       NCHAR (35)    NOT NULL,
    [userID]         NCHAR (35)    NOT NULL,
    [enrolledOn]     DATETIME2 (0) NOT NULL,
    [pending]        BIT           NOT NULL,
    [accepted]       BIT           NOT NULL
);

