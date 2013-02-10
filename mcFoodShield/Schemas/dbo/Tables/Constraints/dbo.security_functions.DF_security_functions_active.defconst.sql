ALTER TABLE [dbo].[security_functions]
    ADD CONSTRAINT [DF_security_functions_active] DEFAULT ((0)) FOR [active];

