﻿ALTER TABLE [dbo].[pt_project_versions]
    ADD CONSTRAINT [PK_pt_project_versions_versionID] PRIMARY KEY CLUSTERED ([versionID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

