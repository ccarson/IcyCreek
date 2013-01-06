ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_IsArchived] DEFAULT ((0)) FOR [IsArchived];

