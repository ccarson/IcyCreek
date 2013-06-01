ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_mobile_mstone_new] DEFAULT (NULL) FOR [mobile_mstone_new];

