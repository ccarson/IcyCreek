ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_deleted] DEFAULT ('0') FOR [deleted];

