ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_doclibrary] DEFAULT ('0') FOR [doclibrary];

