ALTER TABLE [dbo].[contentResources]
    ADD CONSTRAINT [DF_contentResources_isActive] DEFAULT ((1)) FOR [isActive];

