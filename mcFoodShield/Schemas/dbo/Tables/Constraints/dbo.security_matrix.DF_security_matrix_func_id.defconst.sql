ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [DF_security_matrix_func_id] DEFAULT ('0') FOR [func_id];

