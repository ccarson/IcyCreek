ALTER TABLE [dbo].[conf_venue]
    ADD CONSTRAINT [DF_conf_venue_created_by] DEFAULT ('0') FOR [created_by];

