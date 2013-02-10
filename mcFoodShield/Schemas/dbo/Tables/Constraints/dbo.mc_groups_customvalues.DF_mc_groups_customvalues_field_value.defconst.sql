ALTER TABLE [dbo].[mc_groups_customvalues]
    ADD CONSTRAINT [DF_mc_groups_customvalues_field_value] DEFAULT (N'') FOR [field_value];

