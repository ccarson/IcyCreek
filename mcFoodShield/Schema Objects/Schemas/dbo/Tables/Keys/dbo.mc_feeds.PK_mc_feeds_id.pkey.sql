﻿ALTER TABLE [dbo].[mc_feeds]
    ADD CONSTRAINT [PK_mc_feeds_id] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

