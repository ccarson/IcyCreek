ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_deleted] DEFAULT ('0') FOR [deleted];

