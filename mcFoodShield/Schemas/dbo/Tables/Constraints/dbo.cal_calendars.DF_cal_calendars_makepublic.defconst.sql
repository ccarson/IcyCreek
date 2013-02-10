ALTER TABLE [dbo].[cal_calendars]
    ADD CONSTRAINT [DF_cal_calendars_makepublic] DEFAULT ((0)) FOR [makepublic];

