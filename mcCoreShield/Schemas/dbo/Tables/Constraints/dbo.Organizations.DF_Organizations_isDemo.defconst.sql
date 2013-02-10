ALTER TABLE [dbo].[Organizations]
    ADD CONSTRAINT [DF_Organizations_isDemo] DEFAULT ((0)) FOR [isDemo];

