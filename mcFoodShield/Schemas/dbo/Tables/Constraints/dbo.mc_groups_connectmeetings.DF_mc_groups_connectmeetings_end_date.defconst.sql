ALTER TABLE [dbo].[mc_groups_connectmeetings]
    ADD CONSTRAINT [DF_mc_groups_connectmeetings_end_date] DEFAULT (NULL) FOR [end_date];

