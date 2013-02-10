ALTER TABLE [dbo].[mc_organization_customvalues]
    ADD CONSTRAINT [DF_mc_organization_customvalues_org_id] DEFAULT ('0') FOR [org_id];

