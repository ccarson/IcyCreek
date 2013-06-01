ALTER TABLE [dbo].[calendarEventRights]
    ADD CONSTRAINT [DF_calendarEventRights_canEdit] DEFAULT ((0)) FOR [canEdit];

