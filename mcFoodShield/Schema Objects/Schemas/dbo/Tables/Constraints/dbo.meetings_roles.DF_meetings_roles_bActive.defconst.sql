ALTER TABLE [dbo].[meetings_roles]
    ADD CONSTRAINT [DF_meetings_roles_bActive] DEFAULT ((1)) FOR [bActive];

