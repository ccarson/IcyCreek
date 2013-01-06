ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_subactionOID] DEFAULT ('0') FOR [subactionOID];

