ALTER TABLE [dbo].[c_timezones]
    ADD CONSTRAINT [DF_c_timezones_active] DEFAULT ((0)) FOR [active];

