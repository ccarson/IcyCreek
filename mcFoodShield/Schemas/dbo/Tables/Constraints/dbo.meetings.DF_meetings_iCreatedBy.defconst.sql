ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_iCreatedBy] DEFAULT ((0)) FOR [iCreatedBy];

