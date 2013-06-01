ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_date_entered] DEFAULT (NULL) FOR [date_entered];

