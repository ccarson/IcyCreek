ALTER TABLE [dbo].[mtsch_users]
    ADD CONSTRAINT [DF_mtsch_users_mtsch_pollIDFK] DEFAULT ('0') FOR [mtsch_pollIDFK];

