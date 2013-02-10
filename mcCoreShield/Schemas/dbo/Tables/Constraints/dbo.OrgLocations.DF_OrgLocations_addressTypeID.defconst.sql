ALTER TABLE [dbo].[OrgLocations]
    ADD CONSTRAINT [DF_OrgLocations_addressTypeID] DEFAULT ((1)) FOR [addressTypeID];

