ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_name] DEFAULT (N'') FOR [name];

