ALTER TABLE [dbo].[mc_groupmembers_customvalues]
    ADD CONSTRAINT [DF_mc_groupmembers_customvalues_limiter_value] DEFAULT (N'') FOR [limiter_value];

