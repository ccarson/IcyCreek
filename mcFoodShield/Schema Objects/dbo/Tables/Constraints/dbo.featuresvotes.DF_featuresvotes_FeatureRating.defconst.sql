ALTER TABLE [dbo].[featuresvotes]
    ADD CONSTRAINT [DF_featuresvotes_FeatureRating] DEFAULT (NULL) FOR [FeatureRating];

