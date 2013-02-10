ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_allowemails] DEFAULT ((1)) FOR [allowemails];

