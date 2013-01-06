ALTER TABLE [dbo].[cw_pages]
    ADD CONSTRAINT [DF_cw_pages_filemimetype] DEFAULT (NULL) FOR [filemimetype];

