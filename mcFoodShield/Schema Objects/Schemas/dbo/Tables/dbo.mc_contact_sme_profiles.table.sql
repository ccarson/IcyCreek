CREATE TABLE [dbo].[mc_contact_sme_profiles] (
    [id]                 INT            IDENTITY (1, 1) NOT NULL,
    [userID]             INT            NOT NULL,
    [areasOfExpertise]   NVARCHAR (500) NULL,
    [discipline]         NVARCHAR (500) NULL,
    [experience]         NVARCHAR (MAX) NULL,
    [methodologiesTools] NVARCHAR (MAX) NULL
);

