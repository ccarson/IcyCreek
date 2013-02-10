ALTER TABLE [dbo].[mc_terms]
    ADD CONSTRAINT [DF_mc_terms_termname] DEFAULT (N'') FOR [termname];

