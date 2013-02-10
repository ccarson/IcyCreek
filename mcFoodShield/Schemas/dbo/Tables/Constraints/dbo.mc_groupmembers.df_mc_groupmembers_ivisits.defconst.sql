ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [df_mc_groupmembers_ivisits] DEFAULT ((0)) FOR [ivisits];

