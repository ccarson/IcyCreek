ALTER TABLE [dbo].[meetings_types]
    ADD CONSTRAINT [DF_meetings_types_iCapacity] DEFAULT ('0') FOR [iCapacity];

