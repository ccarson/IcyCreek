CREATE TABLE [dbo].[c_sysmember] (
    [id]                INT          IDENTITY (6, 1) NOT NULL,
    [sysmember_name]    VARCHAR (50) NOT NULL,
    [bActive]           BIT          NULL,
    [iPriority]         INT          NOT NULL,
    [expiration_length] INT          NOT NULL,
    [bAllowConcurrent]  BIT          NOT NULL
);

