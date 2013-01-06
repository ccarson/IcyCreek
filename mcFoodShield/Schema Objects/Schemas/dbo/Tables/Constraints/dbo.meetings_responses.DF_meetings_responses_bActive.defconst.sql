ALTER TABLE [dbo].[meetings_responses]
    ADD CONSTRAINT [DF_meetings_responses_bActive] DEFAULT ((1)) FOR [bActive];

