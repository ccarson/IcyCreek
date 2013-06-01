ALTER TABLE [dbo].[security_functions]
    ADD CONSTRAINT [DF_security_functions_func_name] DEFAULT (N'') FOR [func_name];

