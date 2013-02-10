ALTER TABLE [dbo].[methodXPlugins]
    ADD CONSTRAINT [DF_methodXPlugins_isActive] DEFAULT ((1)) FOR [isActive];

