﻿ALTER TABLE [dbo].[mtsch_votes]
    ADD CONSTRAINT [PK_mtsch_votes_mtsch_VoteID] PRIMARY KEY CLUSTERED ([mtsch_VoteID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

