ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [DF_security_matrix_role_id] DEFAULT ('0') FOR [role_id];

