ALTER TABLE [dbo].[mc_groups_custom]
    ADD CONSTRAINT [DF_mc_groups_custom_fieldname] DEFAULT (N'') FOR [fieldname];

