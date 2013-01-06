ALTER TABLE [dbo].[contentResources]
    ADD CONSTRAINT [DF_contentResources_created] DEFAULT (sysdatetime()) FOR [created];

