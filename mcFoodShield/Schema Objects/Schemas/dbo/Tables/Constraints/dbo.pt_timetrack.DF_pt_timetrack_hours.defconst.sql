ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_hours] DEFAULT (NULL) FOR [hours];

