ALTER TABLE [dbo].[mc_access_request_log]
    ADD CONSTRAINT [DF_mc_access_request_log_iStatus] DEFAULT ('0') FOR [iStatus];

