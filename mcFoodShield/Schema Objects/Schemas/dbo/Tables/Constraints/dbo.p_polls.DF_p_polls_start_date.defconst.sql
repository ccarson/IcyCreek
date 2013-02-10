ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_start_date] DEFAULT (NULL) FOR [start_date];

