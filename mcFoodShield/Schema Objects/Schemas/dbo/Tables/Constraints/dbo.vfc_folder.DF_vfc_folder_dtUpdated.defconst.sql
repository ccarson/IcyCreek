﻿ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_dtUpdated] DEFAULT (NULL) FOR [dtUpdated];

