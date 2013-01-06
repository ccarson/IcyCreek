CREATE TABLE [dbo].[ContactSMEProfiles] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [contactsID]         UNIQUEIDENTIFIER NOT NULL,
    [areasOfExpertise]   NVARCHAR (500)   NULL,
    [discipline]         NVARCHAR (500)   NULL,
    [experience]         NVARCHAR (MAX)   NULL,
    [methodologiesTools] NVARCHAR (MAX)   NULL
);

