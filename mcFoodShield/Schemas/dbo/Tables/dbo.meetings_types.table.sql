CREATE TABLE [dbo].[meetings_types] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [sMeetingType] NVARCHAR (50)  NOT NULL,
    [sLocationURL] NVARCHAR (150) NOT NULL,
    [sLogin]       NVARCHAR (100) NOT NULL,
    [sPassword]    NVARCHAR (50)  NOT NULL,
    [bActive]      BIT            NOT NULL,
    [iCapacity]    INT            NOT NULL,
    [bUserDisplay] BIT            NOT NULL
);

