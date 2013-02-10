ALTER TABLE [dbo].[Responses]
    ADD CONSTRAINT [DF_Responses_isDemo] DEFAULT ((0)) FOR [isDemo];

