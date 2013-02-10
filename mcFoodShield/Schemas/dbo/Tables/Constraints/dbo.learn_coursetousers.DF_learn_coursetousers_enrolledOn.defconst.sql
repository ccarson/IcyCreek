ALTER TABLE [dbo].[learn_coursetousers]
    ADD CONSTRAINT [DF_learn_coursetousers_enrolledOn] DEFAULT (getdate()) FOR [enrolledOn];

