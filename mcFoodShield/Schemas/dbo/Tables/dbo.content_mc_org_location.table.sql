﻿CREATE TABLE [dbo].[content_mc_org_location] (
    [id]                 INT            IDENTITY (1356, 1) NOT NULL,
    [name]               NVARCHAR (75)  NOT NULL,
    [addressTypeID]      INT            NULL,
    [address1]           NVARCHAR (200) NULL,
    [address2]           NVARCHAR (200) NULL,
    [address3]           NVARCHAR (200) NULL,
    [city]               NVARCHAR (50)  NULL,
    [state]              NVARCHAR (50)  NULL,
    [zip]                NVARCHAR (10)  NULL,
    [d_phone]            NVARCHAR (25)  NULL,
    [d_fax]              NVARCHAR (25)  NULL,
    [org_id]             INT            NOT NULL,
    [active]             BIT            NOT NULL,
    [notes]              NVARCHAR (MAX) NULL,
    [country]            NVARCHAR (20)  NULL,
    [d_emergency_phone]  NVARCHAR (25)  NULL,
    [d_24hr_phone]       NVARCHAR (25)  NULL,
    [date_added]         DATETIME2 (7)  NULL,
    [date_updated]       DATETIME2 (7)  NULL,
    [d_infectious_phone] NVARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF),
    FOREIGN KEY ([org_id]) REFERENCES [dbo].[content_mc_organization] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([addressTypeID]) REFERENCES [dbo].[content_mc_addresstypes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
);
