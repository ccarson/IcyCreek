﻿ALTER TABLE [dbo].[plfClients]
    ADD CONSTRAINT [plfClientsPK] PRIMARY KEY CLUSTERED ([clientId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

