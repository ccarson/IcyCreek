ALTER TABLE [dbo].[mc_terms]
    ADD CONSTRAINT [DF_mc_terms_enddate] DEFAULT (NULL) FOR [enddate];

