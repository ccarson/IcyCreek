﻿ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [PK_plfCampaignSubscribers] PRIMARY KEY CLUSTERED ([campaignSubscriberId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

