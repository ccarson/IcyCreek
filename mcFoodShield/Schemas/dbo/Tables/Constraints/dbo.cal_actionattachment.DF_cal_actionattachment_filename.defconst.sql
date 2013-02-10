ALTER TABLE [dbo].[cal_actionattachment]
    ADD CONSTRAINT [DF_cal_actionattachment_filename] DEFAULT (N'') FOR [filename];

