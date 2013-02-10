ALTER TABLE [dbo].[learn_usersdeclined]
    ADD CONSTRAINT [DF_learn_usersdeclined_declinedDate] DEFAULT (NULL) FOR [declinedDate];

