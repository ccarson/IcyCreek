ALTER TABLE [dbo].[learn_usersdeclined]
    ADD CONSTRAINT [DF_learn_usersdeclined_userID] DEFAULT ('0') FOR [userID];

