ALTER TABLE [dbo].[mtsch_users]
    ADD CONSTRAINT [DF_mtsch_users_mtsch_answered] DEFAULT ((0)) FOR [mtsch_answered];

