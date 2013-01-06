ALTER TABLE [dbo].[cal_eventnews]
    ADD CONSTRAINT [DF_cal_eventnews_NewsOrder] DEFAULT ('0') FOR [NewsOrder];

