ALTER TABLE [dbo].[calendarEvents]
    ADD CONSTRAINT [FK_calendarEvents_calendarEventCategories] FOREIGN KEY ([categoryID]) REFERENCES [dbo].[calendarEventCategories] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

