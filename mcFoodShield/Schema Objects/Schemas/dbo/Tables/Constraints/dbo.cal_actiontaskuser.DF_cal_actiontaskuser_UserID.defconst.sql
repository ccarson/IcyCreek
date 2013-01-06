ALTER TABLE [dbo].[cal_actiontaskuser]
    ADD CONSTRAINT [DF_cal_actiontaskuser_UserID] DEFAULT ('0') FOR [UserID];

