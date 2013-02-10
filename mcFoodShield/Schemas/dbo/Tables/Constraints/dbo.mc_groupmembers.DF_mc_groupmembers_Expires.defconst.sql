ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_Expires] DEFAULT (NULL) FOR [Expires];

