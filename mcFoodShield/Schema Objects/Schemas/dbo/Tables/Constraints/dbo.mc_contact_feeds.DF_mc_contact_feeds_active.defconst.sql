ALTER TABLE [dbo].[mc_contact_feeds]
    ADD CONSTRAINT [DF_mc_contact_feeds_active] DEFAULT (NULL) FOR [active];

