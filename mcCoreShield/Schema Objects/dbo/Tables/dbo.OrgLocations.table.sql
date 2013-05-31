CREATE TABLE [dbo].[OrgLocations] (
    [id]              UNIQUEIDENTIFIER NOT NULL,
    [organizationID]  UNIQUEIDENTIFIER NOT NULL,
    [addressTypeID]   INT              CONSTRAINT [DF_OrgLocations_addressTypeID] DEFAULT ((1)) NULL,
    [name]            NVARCHAR (500)   NULL,
    [address1]        NVARCHAR (200)   NULL,
    [address2]        NVARCHAR (200)   NULL,
    [address3]        NVARCHAR (200)   NULL,
    [city]            NVARCHAR (50)    NULL,
    [state]           NVARCHAR (50)    NULL,
    [zip]             NVARCHAR (10)    NULL,
    [phone]           NVARCHAR (25)    NULL,
    [fax]             NVARCHAR (25)    NULL,
    [isActive]        BIT              NULL,
    [notes]           NVARCHAR (500)   NULL,
    [country]         NVARCHAR (20)    NULL,
    [emergencyPhone]  NVARCHAR (25)    NULL,
    [allHoursPhone]   NVARCHAR (25)    NULL,
    [infectiousPhone] NVARCHAR (25)    NULL,
    [isAlternate]     BIT              NULL,
    [createdBy]       UNIQUEIDENTIFIER NULL,
    [createdOn]       DATETIME2 (7)    NULL,
    [updatedBy]       UNIQUEIDENTIFIER NULL,
    [updatedOn]       DATETIME2 (7)    NULL,
    CONSTRAINT [PK_OrgLocations] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_OrgLocations_Organizations] FOREIGN KEY ([organizationID]) REFERENCES [dbo].[Organizations] ([id])
);




GO
CREATE NONCLUSTERED INDEX [IX_OrgLocations_organizationID]
    ON [dbo].[OrgLocations]([organizationID] ASC);

