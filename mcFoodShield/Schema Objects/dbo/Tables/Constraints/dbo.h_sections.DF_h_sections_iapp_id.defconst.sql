ALTER TABLE [dbo].[h_sections]
    ADD CONSTRAINT [DF_h_sections_iapp_id] DEFAULT ('0') FOR [iapp_id];

