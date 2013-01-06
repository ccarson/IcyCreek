CREATE TABLE [dbo].[mc_membertypes] (
    [MemberTypeID] INT          IDENTITY (1, 1) NOT NULL,
    [membertype]   VARCHAR (50) NOT NULL,
    [memberdues]   DECIMAL (10) NOT NULL,
    [description]  VARCHAR (50) NULL,
    [isActive]     BIT          NULL,
    [iPriority]    INT          NOT NULL
);

