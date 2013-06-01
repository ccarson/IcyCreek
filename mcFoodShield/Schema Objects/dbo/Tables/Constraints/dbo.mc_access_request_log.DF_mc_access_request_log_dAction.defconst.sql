ALTER TABLE [dbo].[mc_access_request_log]
    ADD CONSTRAINT [DF_mc_access_request_log_dAction] DEFAULT (NULL) FOR [dAction];

