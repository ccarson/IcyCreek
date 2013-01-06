ALTER TABLE [dbo].[c_orgroles]
    ADD CONSTRAINT [DF_c_orgroles_roleName] DEFAULT (N'') FOR [roleName];

