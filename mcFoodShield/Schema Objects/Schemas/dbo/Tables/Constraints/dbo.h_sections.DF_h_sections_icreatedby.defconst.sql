ALTER TABLE [dbo].[h_sections]
    ADD CONSTRAINT [DF_h_sections_icreatedby] DEFAULT ('0') FOR [icreatedby];

