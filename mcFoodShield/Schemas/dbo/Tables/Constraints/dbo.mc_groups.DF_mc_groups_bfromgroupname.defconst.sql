ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_bfromgroupname] DEFAULT ((1)) FOR [bfromgroupname];

