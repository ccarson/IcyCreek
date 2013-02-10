ALTER TABLE [dbo].[mc_org_department_addresses]
    ADD CONSTRAINT [DF_mc_org_department_addresses_dept_id] DEFAULT ('0') FOR [dept_id];

