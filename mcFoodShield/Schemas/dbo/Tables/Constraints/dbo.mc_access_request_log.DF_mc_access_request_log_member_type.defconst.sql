ALTER TABLE [dbo].[mc_access_request_log]
    ADD CONSTRAINT [DF_mc_access_request_log_member_type] DEFAULT ('0') FOR [member_type];

