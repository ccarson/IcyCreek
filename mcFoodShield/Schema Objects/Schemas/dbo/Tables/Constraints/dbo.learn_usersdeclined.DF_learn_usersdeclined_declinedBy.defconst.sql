ALTER TABLE [dbo].[learn_usersdeclined]
    ADD CONSTRAINT [DF_learn_usersdeclined_declinedBy] DEFAULT ('0') FOR [declinedBy];

