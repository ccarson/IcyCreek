ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_iAgendaID] DEFAULT ((0)) FOR [iAgendaID];

