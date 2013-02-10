ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_newsletters] DEFAULT ('0') FOR [newsletters];

