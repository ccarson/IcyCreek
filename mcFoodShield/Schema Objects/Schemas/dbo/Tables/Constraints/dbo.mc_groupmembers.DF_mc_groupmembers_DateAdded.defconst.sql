ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_DateAdded] DEFAULT (NULL) FOR [DateAdded];

