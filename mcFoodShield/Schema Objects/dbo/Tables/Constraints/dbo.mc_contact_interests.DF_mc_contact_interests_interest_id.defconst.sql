ALTER TABLE [dbo].[mc_contact_interests]
    ADD CONSTRAINT [DF_mc_contact_interests_interest_id] DEFAULT ('0') FOR [interest_id];

