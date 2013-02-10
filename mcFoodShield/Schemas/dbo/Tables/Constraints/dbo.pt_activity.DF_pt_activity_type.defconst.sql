ALTER TABLE [dbo].[pt_activity]
    ADD CONSTRAINT [DF_pt_activity_type] DEFAULT (NULL) FOR [type];

