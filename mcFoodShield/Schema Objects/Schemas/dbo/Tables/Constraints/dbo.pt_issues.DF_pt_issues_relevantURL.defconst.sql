﻿ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_relevantURL] DEFAULT (NULL) FOR [relevantURL];

