ALTER TABLE [dbo].[cal_eventnews]
    ADD CONSTRAINT [DF_cal_eventnews_NewsInactive] DEFAULT ((0)) FOR [NewsInactive];

