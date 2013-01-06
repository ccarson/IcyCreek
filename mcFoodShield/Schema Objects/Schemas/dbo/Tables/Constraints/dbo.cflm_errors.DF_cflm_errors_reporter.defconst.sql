ALTER TABLE [dbo].[cflm_errors]
    ADD CONSTRAINT [DF_cflm_errors_reporter] DEFAULT ('0') FOR [reporter];

