ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_iSchedulerID] DEFAULT ((0)) FOR [iSchedulerID];

