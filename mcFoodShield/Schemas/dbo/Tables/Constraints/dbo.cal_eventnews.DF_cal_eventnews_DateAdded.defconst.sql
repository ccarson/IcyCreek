ALTER TABLE [dbo].[cal_eventnews]
    ADD CONSTRAINT [DF_cal_eventnews_DateAdded] DEFAULT (NULL) FOR [DateAdded];

