﻿ALTER TABLE [dbo].[cflm_errors]
    ADD CONSTRAINT [DF_cflm_errors_linkid] DEFAULT ('0') FOR [linkid];

