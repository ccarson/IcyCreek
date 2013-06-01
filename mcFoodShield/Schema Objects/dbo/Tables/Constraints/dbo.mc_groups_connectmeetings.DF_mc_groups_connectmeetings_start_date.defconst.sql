ALTER TABLE [dbo].[mc_groups_connectmeetings]
    ADD CONSTRAINT [DF_mc_groups_connectmeetings_start_date] DEFAULT (NULL) FOR [start_date];

