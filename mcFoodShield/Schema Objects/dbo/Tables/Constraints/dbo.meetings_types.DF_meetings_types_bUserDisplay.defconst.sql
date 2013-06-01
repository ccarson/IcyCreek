ALTER TABLE [dbo].[meetings_types]
    ADD CONSTRAINT [DF_meetings_types_bUserDisplay] DEFAULT ((1)) FOR [bUserDisplay];

