﻿ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [PK_ReportGroupQuestions] PRIMARY KEY CLUSTERED ([reportGroupQuestionsID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
