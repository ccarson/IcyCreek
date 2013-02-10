ALTER TABLE [dbo].[mc_access_request]
    ADD CONSTRAINT [DF_mc_access_request_group_id] DEFAULT ('0') FOR [group_id];

