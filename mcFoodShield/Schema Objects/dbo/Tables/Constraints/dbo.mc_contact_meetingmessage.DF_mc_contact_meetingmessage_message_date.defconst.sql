ALTER TABLE [dbo].[mc_contact_meetingmessage]
    ADD CONSTRAINT [DF_mc_contact_meetingmessage_message_date] DEFAULT (NULL) FOR [message_date];

