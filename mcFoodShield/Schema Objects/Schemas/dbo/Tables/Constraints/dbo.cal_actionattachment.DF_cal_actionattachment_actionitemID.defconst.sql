ALTER TABLE [dbo].[cal_actionattachment]
    ADD CONSTRAINT [DF_cal_actionattachment_actionitemID] DEFAULT ('0') FOR [actionitemID];

