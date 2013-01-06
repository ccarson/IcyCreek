ALTER TABLE [dbo].[c_affiliation]
    ADD CONSTRAINT [DF_c_affiliation_bActive] DEFAULT ((1)) FOR [bActive];

