ALTER TABLE [dbo].[mc_contact_custom]
    ADD CONSTRAINT [DF_mc_contact_custom_participatory] DEFAULT ((0)) FOR [participatory];

