﻿ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_phone] DEFAULT (NULL) FOR [phone];

