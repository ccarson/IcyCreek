﻿ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_mobile_msg_new] DEFAULT (NULL) FOR [mobile_msg_new];

