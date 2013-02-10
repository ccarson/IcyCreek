ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_bActive] DEFAULT ((1)) FOR [bActive];

