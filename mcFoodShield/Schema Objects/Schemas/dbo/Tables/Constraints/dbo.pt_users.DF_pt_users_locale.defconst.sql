ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_locale] DEFAULT (NULL) FOR [locale];

