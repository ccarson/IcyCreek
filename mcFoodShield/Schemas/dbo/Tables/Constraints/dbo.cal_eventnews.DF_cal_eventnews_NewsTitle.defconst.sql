ALTER TABLE [dbo].[cal_eventnews]
    ADD CONSTRAINT [DF_cal_eventnews_NewsTitle] DEFAULT (N'') FOR [NewsTitle];

