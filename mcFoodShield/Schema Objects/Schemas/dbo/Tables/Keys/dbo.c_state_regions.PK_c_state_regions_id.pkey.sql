﻿ALTER TABLE [dbo].[c_state_regions]
    ADD CONSTRAINT [PK_c_state_regions_id] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

