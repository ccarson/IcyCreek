ALTER TABLE [dbo].[h_sections]
    ADD CONSTRAINT [DF_h_sections_bactive] DEFAULT ((1)) FOR [bactive];

