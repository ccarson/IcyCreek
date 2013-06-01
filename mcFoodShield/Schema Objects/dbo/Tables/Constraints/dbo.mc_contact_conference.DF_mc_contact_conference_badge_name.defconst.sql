ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_badge_name] DEFAULT (NULL) FOR [badge_name];

