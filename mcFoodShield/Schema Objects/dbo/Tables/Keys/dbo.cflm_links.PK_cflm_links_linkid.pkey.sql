﻿ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [PK_cflm_links_linkid] PRIMARY KEY CLUSTERED ([linkid] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

