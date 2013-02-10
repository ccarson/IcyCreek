ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_rateID] DEFAULT (NULL) FOR [rateID];

