ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_bPriority] DEFAULT ((0)) FOR [bPriority];

