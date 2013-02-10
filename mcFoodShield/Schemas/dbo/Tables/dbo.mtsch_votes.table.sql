CREATE TABLE [dbo].[mtsch_votes] (
    [mtsch_VoteID]    INT           IDENTITY (530, 1) NOT NULL,
    [mtsch_PollFK]    INT           NOT NULL,
    [mtsch_TimeFK]    INT           NOT NULL,
    [mtsch_Session]   VARCHAR (150) NOT NULL,
    [mtsch_IPAddr]    VARCHAR (15)  NOT NULL,
    [mtsch_VoteName]  VARCHAR (150) NULL,
    [mtsch_Cluster]   VARCHAR (50)  NOT NULL,
    [mtsch_DateStamp] DATETIME      NOT NULL,
    [mtsch_userID]    INT           NOT NULL
);

