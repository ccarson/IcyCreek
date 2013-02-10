ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_type_id] DEFAULT ('0') FOR [type_id];

