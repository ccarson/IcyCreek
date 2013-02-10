ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_iConnectID] DEFAULT ((0)) FOR [iConnectID];

