ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_calendar] DEFAULT ('0') FOR [calendar];

