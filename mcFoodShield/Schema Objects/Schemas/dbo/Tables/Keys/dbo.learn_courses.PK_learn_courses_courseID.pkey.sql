﻿ALTER TABLE [dbo].[learn_courses]
    ADD CONSTRAINT [PK_learn_courses_courseID] PRIMARY KEY CLUSTERED ([courseID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
