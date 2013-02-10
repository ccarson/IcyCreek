ALTER TABLE [dbo].[mtsch_votes]
    ADD CONSTRAINT [DF_mtsch_votes_mtsch_VoteName] DEFAULT (NULL) FOR [mtsch_VoteName];

