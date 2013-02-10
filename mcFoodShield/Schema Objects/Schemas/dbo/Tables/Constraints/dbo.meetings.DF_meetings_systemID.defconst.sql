ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_systemID] DEFAULT ((0)) FOR [systemID];

