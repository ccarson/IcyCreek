ALTER TABLE [dbo].[mc_grouptypes_roles]
    ADD CONSTRAINT [DF_mc_grouptypes_roles_grouptype_id] DEFAULT ('0') FOR [grouptype_id];

