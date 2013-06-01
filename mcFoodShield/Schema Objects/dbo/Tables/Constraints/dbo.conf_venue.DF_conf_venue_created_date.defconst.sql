ALTER TABLE [dbo].[conf_venue]
    ADD CONSTRAINT [DF_conf_venue_created_date] DEFAULT (NULL) FOR [created_date];

