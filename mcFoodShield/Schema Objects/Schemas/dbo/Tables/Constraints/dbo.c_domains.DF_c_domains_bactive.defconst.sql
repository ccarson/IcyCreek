ALTER TABLE [dbo].[c_domains]
    ADD CONSTRAINT [DF_c_domains_bactive] DEFAULT ((1)) FOR [bactive];

