ALTER TABLE [dbo].[pt_activity]
    ADD CONSTRAINT [DF_pt_activity_activity] DEFAULT (NULL) FOR [activity];

