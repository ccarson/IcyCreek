ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_report] DEFAULT (NULL) FOR [report];

