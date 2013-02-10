ALTER TABLE [dbo].[conf_venue]
    ADD CONSTRAINT [DF_conf_venue_address2] DEFAULT (NULL) FOR [address2];

