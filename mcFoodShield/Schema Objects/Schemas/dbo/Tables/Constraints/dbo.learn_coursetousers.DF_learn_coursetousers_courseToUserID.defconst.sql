ALTER TABLE [dbo].[learn_coursetousers]
    ADD CONSTRAINT [DF_learn_coursetousers_courseToUserID] DEFAULT (N'') FOR [courseToUserID];

