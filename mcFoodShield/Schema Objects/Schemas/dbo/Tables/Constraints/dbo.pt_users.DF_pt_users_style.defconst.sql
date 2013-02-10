ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_style] DEFAULT (NULL) FOR [style];

