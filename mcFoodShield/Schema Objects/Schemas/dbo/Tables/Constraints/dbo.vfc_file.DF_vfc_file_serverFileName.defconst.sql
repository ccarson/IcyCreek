﻿ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_serverFileName] DEFAULT (N'') FOR [serverFileName];

