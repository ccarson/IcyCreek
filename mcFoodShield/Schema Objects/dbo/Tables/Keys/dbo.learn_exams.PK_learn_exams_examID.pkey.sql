﻿ALTER TABLE [dbo].[learn_exams]
    ADD CONSTRAINT [PK_learn_exams_examID] PRIMARY KEY CLUSTERED ([examID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

