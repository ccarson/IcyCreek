ALTER TABLE [dbo].[mc_terms]
    ADD CONSTRAINT [DF_mc_terms_startdate] DEFAULT (NULL) FOR [startdate];

