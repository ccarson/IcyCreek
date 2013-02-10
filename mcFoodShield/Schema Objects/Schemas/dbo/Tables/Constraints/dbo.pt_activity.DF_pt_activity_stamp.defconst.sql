ALTER TABLE [dbo].[pt_activity]
    ADD CONSTRAINT [DF_pt_activity_stamp] DEFAULT (NULL) FOR [stamp];

