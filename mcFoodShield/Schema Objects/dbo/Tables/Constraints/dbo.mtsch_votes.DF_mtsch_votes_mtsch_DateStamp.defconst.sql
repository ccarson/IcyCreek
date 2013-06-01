ALTER TABLE [dbo].[mtsch_votes]
    ADD CONSTRAINT [DF_mtsch_votes_mtsch_DateStamp] DEFAULT (getdate()) FOR [mtsch_DateStamp];

