ALTER TABLE [dbo].[conf_venue]
    ADD CONSTRAINT [DF_conf_venue_updated_by] DEFAULT ('0') FOR [updated_by];

