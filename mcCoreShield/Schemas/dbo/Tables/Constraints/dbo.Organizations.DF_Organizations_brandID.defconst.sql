ALTER TABLE [dbo].[Organizations]
    ADD CONSTRAINT [DF_Organizations_brandID] DEFAULT ((1)) FOR [brandID];

