﻿ALTER TABLE [dbo].[mtsch_poll]
    ADD CONSTRAINT [PK_mtsch_poll_mtsch_PollID] PRIMARY KEY CLUSTERED ([mtsch_PollID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
