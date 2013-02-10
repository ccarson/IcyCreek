ALTER TABLE [dbo].[meetings_types]
    ADD CONSTRAINT [DF_meetings_types_bActive] DEFAULT ((1)) FOR [bActive];

