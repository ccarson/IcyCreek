﻿ALTER TABLE [dbo].[c_domains]
    ADD CONSTRAINT [DF_c_domains_createdBy] DEFAULT ((0)) FOR [createdBy];

