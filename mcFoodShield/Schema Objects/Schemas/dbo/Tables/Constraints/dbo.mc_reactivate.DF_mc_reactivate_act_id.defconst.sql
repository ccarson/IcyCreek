ALTER TABLE [dbo].[mc_reactivate]
    ADD CONSTRAINT [DF_mc_reactivate_act_id] DEFAULT (N'') FOR [act_id];

