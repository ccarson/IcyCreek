ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_updatedOn] DEFAULT (getdate()) FOR [updatedOn];

