﻿ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_msg_new] DEFAULT (NULL) FOR [email_msg_new];

