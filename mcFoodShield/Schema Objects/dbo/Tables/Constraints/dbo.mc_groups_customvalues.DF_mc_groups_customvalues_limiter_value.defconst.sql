ALTER TABLE [dbo].[mc_groups_customvalues]
    ADD CONSTRAINT [DF_mc_groups_customvalues_limiter_value] DEFAULT (N'') FOR [limiter_value];

