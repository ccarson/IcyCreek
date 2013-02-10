ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_allowcustom] DEFAULT ((0)) FOR [allowcustom];

