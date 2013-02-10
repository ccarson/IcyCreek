ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [DF_security_matrix_sys_admin] DEFAULT ((0)) FOR [sys_admin];

