﻿ALTER TABLE [dbo].[p_polls]
    ADD CONSTRAINT [DF_p_polls_active] DEFAULT ((0)) FOR [active];

