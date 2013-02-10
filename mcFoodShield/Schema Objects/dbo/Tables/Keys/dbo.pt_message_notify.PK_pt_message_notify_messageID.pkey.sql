﻿ALTER TABLE [dbo].[pt_message_notify]
    ADD CONSTRAINT [PK_pt_message_notify_messageID] PRIMARY KEY CLUSTERED ([messageID] ASC, [projectID] ASC, [userID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

