ALTER TABLE [dbo].[OrgDepartmentLab]
    ADD CONSTRAINT [FK_OrgDepartmentLab_OrgDepartments] FOREIGN KEY ([id]) REFERENCES [dbo].[OrgDepartments] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[OrgDepartmentLab] NOCHECK CONSTRAINT [FK_OrgDepartmentLab_OrgDepartments];

