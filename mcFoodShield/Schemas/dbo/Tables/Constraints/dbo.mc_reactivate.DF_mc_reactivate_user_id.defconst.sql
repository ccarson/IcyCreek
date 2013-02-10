ALTER TABLE [dbo].[mc_reactivate]
    ADD CONSTRAINT [DF_mc_reactivate_user_id] DEFAULT ('0') FOR [user_id];

