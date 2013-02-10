ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_billed] DEFAULT (NULL) FOR [billed];

