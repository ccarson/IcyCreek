ALTER TABLE [dbo].[security_functions]
    ADD CONSTRAINT [DF_security_functions_func_id] DEFAULT ('0') FOR [func_id];

