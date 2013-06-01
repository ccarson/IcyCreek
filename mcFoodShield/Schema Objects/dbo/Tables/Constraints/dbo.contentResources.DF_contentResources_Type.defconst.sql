ALTER TABLE [dbo].[contentResources]
    ADD CONSTRAINT [DF_contentResources_Type] DEFAULT (N'R') FOR [Type];

