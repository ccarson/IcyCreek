ALTER TABLE [dbo].[mtsch_votes]
    ADD CONSTRAINT [DF_mtsch_votes_mtsch_userID] DEFAULT ('0') FOR [mtsch_userID];

