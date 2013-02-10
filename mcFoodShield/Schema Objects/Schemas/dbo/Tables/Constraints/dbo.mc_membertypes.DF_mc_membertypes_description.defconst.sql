ALTER TABLE [dbo].[mc_membertypes]
    ADD CONSTRAINT [DF_mc_membertypes_description] DEFAULT (NULL) FOR [description];

