ALTER TABLE [dbo].[user_login_redirects]
    ADD CONSTRAINT [DF_user_login_redirects_is_complete] DEFAULT ((0)) FOR [is_complete];

