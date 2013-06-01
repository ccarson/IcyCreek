ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_paid] DEFAULT (NULL) FOR [paid];

