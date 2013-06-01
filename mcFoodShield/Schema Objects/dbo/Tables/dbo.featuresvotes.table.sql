CREATE TABLE [dbo].[featuresvotes] (
    [FeaturesVotesID] INT             IDENTITY (10, 1) NOT NULL,
    [FeatureID]       INT             NOT NULL,
    [FeatureRating]   DECIMAL (10, 1) NULL,
    [userid]          INT             NOT NULL
);

