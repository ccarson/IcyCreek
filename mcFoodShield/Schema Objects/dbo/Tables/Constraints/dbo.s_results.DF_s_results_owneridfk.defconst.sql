﻿ALTER TABLE [dbo].[s_results]
    ADD CONSTRAINT [DF_s_results_owneridfk] DEFAULT (N'') FOR [owneridfk];

