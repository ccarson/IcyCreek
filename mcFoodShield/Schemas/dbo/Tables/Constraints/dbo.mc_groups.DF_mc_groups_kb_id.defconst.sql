ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_kb_id] DEFAULT ('0') FOR [kb_id];

