﻿CREATE TABLE [dbo].[contentFunding] (
    [id]                      UNIQUEIDENTIFIER NOT NULL,
    [fundingAgencyID]         INT              NULL,
    [name]                    NVARCHAR (500)   NOT NULL,
    [url]                     NVARCHAR (500)   NOT NULL,
    [description]             NVARCHAR (MAX)   NOT NULL,
    [otherInformation]        NVARCHAR (MAX)   NOT NULL,
    [isActive]                BIT              NOT NULL,
    [referenceCode]           NVARCHAR (100)   NOT NULL,
    [eligibilityCriteria]     NVARCHAR (MAX)   NOT NULL,
    [fundingAmount]           MONEY            NOT NULL,
    [awardCeiling]            MONEY            NULL,
    [fundingInstrumentType]   NVARCHAR (10)    NULL,
    [applicationsBegin]       DATETIME2 (7)    NULL,
    [originalApplicationsDue] DATETIME2 (7)    NULL,
    [currentApplicationsDue]  DATETIME2 (7)    NULL,
    [numAwards]               INT              NULL,
    [fundingStatus]           NVARCHAR (10)    NOT NULL,
    [matchingRequirements]    NVARCHAR (200)   NULL,
    [created]                 DATETIME2 (7)    NOT NULL,
    [createdBy]               INT              NOT NULL,
    [updated]                 DATETIME2 (7)    NULL,
    [updatedBy]               INT              NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);
