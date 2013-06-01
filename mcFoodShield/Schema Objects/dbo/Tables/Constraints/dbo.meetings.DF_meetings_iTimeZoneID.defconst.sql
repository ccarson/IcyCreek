ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_iTimeZoneID] DEFAULT ((0)) FOR [iTimeZoneID];

