﻿ALTER TABLE [dbo].[mc_groups_publicpages]
    ADD CONSTRAINT [DF_mc_groups_publicpages_bactive] DEFAULT ((0)) FOR [bactive];

