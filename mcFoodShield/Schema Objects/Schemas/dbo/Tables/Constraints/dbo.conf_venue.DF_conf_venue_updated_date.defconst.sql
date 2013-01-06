ALTER TABLE [dbo].[conf_venue]
    ADD CONSTRAINT [DF_conf_venue_updated_date] DEFAULT (NULL) FOR [updated_date];

