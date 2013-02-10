ALTER TABLE [dbo].[events]
    ADD CONSTRAINT [DF_events_userid] DEFAULT (NULL) FOR [userid];

