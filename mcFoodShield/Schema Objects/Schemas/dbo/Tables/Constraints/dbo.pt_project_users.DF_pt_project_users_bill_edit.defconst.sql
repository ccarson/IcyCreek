﻿ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_bill_edit] DEFAULT (NULL) FOR [bill_edit];

