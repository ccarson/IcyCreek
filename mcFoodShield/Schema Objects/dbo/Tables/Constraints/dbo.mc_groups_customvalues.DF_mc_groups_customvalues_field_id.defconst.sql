ALTER TABLE [dbo].[mc_groups_customvalues]
    ADD CONSTRAINT [DF_mc_groups_customvalues_field_id] DEFAULT ('0') FOR [field_id];

