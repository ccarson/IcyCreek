ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_bill_rates] DEFAULT (NULL) FOR [bill_rates];

