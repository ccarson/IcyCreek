ALTER TABLE [dbo].[c_grouppages]
    ADD CONSTRAINT [DF_c_grouppages_bactive] DEFAULT ((1)) FOR [bactive];

