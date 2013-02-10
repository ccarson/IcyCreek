ALTER TABLE [dbo].[features]
    ADD CONSTRAINT [DF_features_Active] DEFAULT (NULL) FOR [Active];

