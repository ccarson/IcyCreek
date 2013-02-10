ALTER TABLE [dbo].[cflm_errors]
    ADD CONSTRAINT [DF_cflm_errors_resolved] DEFAULT ('0') FOR [resolved];

