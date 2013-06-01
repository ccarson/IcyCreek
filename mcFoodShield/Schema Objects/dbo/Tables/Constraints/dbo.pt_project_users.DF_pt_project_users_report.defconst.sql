ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_report] DEFAULT (NULL) FOR [report];

