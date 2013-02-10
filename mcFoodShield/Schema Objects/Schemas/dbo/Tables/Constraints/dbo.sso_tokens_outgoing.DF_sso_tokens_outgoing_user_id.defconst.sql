ALTER TABLE [dbo].[sso_tokens_outgoing]
    ADD CONSTRAINT [DF_sso_tokens_outgoing_user_id] DEFAULT ((0)) FOR [user_id];

