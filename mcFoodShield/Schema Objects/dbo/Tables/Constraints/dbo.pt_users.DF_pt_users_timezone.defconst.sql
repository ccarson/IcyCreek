ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_timezone] DEFAULT (NULL) FOR [timezone];

