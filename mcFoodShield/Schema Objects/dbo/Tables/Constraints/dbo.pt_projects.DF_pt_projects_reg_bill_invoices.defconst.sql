ALTER TABLE [dbo].[pt_projects]
    ADD CONSTRAINT [DF_pt_projects_reg_bill_invoices] DEFAULT (NULL) FOR [reg_bill_invoices];

