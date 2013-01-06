ALTER TABLE [dbo].[cw_pages]
    ADD CONSTRAINT [DF_cw_pages_summary] DEFAULT (NULL) FOR [summary];

