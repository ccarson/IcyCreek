ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_end_date] DEFAULT (NULL) FOR [end_date];

