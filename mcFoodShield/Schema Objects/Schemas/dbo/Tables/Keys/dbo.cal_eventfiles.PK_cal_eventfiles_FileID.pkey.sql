﻿ALTER TABLE [dbo].[cal_eventfiles]
    ADD CONSTRAINT [PK_cal_eventfiles_FileID] PRIMARY KEY CLUSTERED ([FileID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

