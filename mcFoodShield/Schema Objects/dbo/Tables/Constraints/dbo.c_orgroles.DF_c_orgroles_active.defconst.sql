ALTER TABLE [dbo].[c_orgroles]
    ADD CONSTRAINT [DF_c_orgroles_active] DEFAULT ((0)) FOR [active];

