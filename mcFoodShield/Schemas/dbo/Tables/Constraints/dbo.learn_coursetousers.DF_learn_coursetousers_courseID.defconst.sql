ALTER TABLE [dbo].[learn_coursetousers]
    ADD CONSTRAINT [DF_learn_coursetousers_courseID] DEFAULT (N'') FOR [courseID];

