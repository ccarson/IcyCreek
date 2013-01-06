ALTER TABLE [dbo].[pt_activity]
    ADD CONSTRAINT [DF_pt_activity_name] DEFAULT (NULL) FOR [name];

