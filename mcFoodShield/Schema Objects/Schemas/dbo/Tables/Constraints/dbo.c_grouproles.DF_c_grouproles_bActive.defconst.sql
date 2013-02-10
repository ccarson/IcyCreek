ALTER TABLE [dbo].[c_grouproles]
    ADD CONSTRAINT [DF_c_grouproles_bActive] DEFAULT ((1)) FOR [bActive];

