ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_dateStamp] DEFAULT (NULL) FOR [dateStamp];

