ALTER TABLE [dbo].[mc_reactivate]
    ADD CONSTRAINT [DF_mc_reactivate_expiresOn] DEFAULT (NULL) FOR [expiresOn];

