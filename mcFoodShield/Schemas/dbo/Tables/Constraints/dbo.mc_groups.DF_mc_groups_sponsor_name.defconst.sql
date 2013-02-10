ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_sponsor_name] DEFAULT (NULL) FOR [sponsor_name];

