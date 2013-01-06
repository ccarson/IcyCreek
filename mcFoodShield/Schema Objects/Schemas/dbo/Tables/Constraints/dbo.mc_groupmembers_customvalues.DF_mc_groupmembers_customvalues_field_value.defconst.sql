ALTER TABLE [dbo].[mc_groupmembers_customvalues]
    ADD CONSTRAINT [DF_mc_groupmembers_customvalues_field_value] DEFAULT (N'') FOR [field_value];

