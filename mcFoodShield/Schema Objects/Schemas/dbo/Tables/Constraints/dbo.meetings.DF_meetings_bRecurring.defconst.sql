ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_bRecurring] DEFAULT ((0)) FOR [bRecurring];

