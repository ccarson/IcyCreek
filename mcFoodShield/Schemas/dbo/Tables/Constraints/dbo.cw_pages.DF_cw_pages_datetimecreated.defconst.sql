ALTER TABLE [dbo].[cw_pages]
    ADD CONSTRAINT [DF_cw_pages_datetimecreated] DEFAULT (NULL) FOR [datetimecreated];

