ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_allowcustommember] DEFAULT ((0)) FOR [allowcustommember];

