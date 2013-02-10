ALTER TABLE [dbo].[OrgDepartments]
    ADD CONSTRAINT [DF_OrgDepartments_active] DEFAULT ((1)) FOR [active];

