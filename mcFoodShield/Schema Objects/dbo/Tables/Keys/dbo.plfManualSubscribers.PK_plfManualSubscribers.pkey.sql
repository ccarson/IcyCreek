﻿ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [PK_plfManualSubscribers] PRIMARY KEY CLUSTERED ([subscriberId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

