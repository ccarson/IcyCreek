ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_password] DEFAULT (N'') FOR [password];

