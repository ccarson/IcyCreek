﻿ALTER TABLE [dbo].[ReportVersions]
    ADD CONSTRAINT [PK_ReportVersions] PRIMARY KEY CLUSTERED ([reportVersionsID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

