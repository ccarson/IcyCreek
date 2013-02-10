ALTER TABLE [dbo].[pt_todolists]
    ADD CONSTRAINT [DF_pt_todolists_timetrack] DEFAULT (NULL) FOR [timetrack];

