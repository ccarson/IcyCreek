﻿ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_mobile_todo_com] DEFAULT (NULL) FOR [mobile_todo_com];

