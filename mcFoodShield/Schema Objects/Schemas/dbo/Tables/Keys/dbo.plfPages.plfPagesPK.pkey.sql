﻿ALTER TABLE [dbo].[plfPages]
    ADD CONSTRAINT [plfPagesPK] PRIMARY KEY CLUSTERED ([pageId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

