﻿ALTER TABLE [dbo].[galleon_users]
    ADD CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
