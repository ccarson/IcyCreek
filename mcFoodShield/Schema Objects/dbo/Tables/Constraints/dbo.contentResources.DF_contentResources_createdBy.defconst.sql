ALTER TABLE [dbo].[contentResources]
    ADD CONSTRAINT [DF_contentResources_createdBy] DEFAULT ((0)) FOR [createdBy];

