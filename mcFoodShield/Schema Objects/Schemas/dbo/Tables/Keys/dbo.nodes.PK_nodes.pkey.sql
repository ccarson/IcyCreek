﻿ALTER TABLE [dbo].[nodes]
    ADD CONSTRAINT [PK_nodes] PRIMARY KEY CLUSTERED ([nodeId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

