﻿ALTER TABLE [dbo].[mc_contact_messages]
    ADD CONSTRAINT [DF_mc_contact_messages_archive] DEFAULT ((0)) FOR [archive];

