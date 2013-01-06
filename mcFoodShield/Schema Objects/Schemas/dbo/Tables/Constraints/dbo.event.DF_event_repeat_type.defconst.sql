ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_repeat_type] DEFAULT ((0)) FOR [repeat_type];

