﻿ALTER TABLE [dbo].[mc_groupmembers_custom]
    ADD CONSTRAINT [PK_mc_groupmembers_custom_id] PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
