ALTER TABLE [dbo].[pt_timetrack]
    ADD CONSTRAINT [DF_pt_timetrack_description] DEFAULT (NULL) FOR [description];

