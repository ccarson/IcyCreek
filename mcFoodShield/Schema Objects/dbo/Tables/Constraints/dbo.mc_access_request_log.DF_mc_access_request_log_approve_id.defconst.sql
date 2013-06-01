ALTER TABLE [dbo].[mc_access_request_log]
    ADD CONSTRAINT [DF_mc_access_request_log_approve_id] DEFAULT ('0') FOR [approve_id];

