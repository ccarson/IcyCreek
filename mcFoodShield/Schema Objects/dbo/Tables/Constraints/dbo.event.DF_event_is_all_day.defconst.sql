ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_is_all_day] DEFAULT ((0)) FOR [is_all_day];

