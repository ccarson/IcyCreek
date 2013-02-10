ALTER TABLE [dbo].[cal_eventnews]
    ADD CONSTRAINT [DF_cal_eventnews_LastUpdate] DEFAULT (NULL) FOR [LastUpdate];

