﻿ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_mobile_issue_upd] DEFAULT (NULL) FOR [mobile_issue_upd];

