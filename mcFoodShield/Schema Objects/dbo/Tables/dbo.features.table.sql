CREATE TABLE [dbo].[features] (
    [FeatureID]        INT            IDENTITY (8, 1) NOT NULL,
    [FeatureTitle]     NVARCHAR (MAX) NULL,
    [FeatureShortDesc] NVARCHAR (MAX) NULL,
    [FeatureLongDesc]  NVARCHAR (MAX) NULL,
    [Active]           BIT            NULL
);

