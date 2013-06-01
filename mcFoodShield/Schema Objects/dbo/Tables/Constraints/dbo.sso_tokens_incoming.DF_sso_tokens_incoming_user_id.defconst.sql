ALTER TABLE [dbo].[sso_tokens_incoming]
    ADD CONSTRAINT [DF_sso_tokens_incoming_user_id] DEFAULT ((0)) FOR [user_id];

