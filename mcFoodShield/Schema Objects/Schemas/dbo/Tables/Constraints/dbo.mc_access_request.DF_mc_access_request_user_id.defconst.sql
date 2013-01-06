ALTER TABLE [dbo].[mc_access_request]
    ADD CONSTRAINT [DF_mc_access_request_user_id] DEFAULT ('0') FOR [user_id];

