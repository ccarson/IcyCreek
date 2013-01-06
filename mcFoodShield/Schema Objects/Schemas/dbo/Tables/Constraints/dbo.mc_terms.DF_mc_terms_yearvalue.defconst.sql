ALTER TABLE [dbo].[mc_terms]
    ADD CONSTRAINT [DF_mc_terms_yearvalue] DEFAULT ('0') FOR [yearvalue];

