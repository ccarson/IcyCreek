ALTER TABLE [dbo].[mc_org_department_addresses]
    ADD CONSTRAINT [DF_mc_org_department_addresses_address2] DEFAULT (N'') FOR [address2];

