ALTER TABLE [dbo].[mc_terms]
    ADD CONSTRAINT [DF_mc_terms_active] DEFAULT ((0)) FOR [active];

