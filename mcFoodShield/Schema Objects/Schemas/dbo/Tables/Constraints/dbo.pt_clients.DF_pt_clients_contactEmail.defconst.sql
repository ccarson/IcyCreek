﻿ALTER TABLE [dbo].[pt_clients]
    ADD CONSTRAINT [DF_pt_clients_contactEmail] DEFAULT (NULL) FOR [contactEmail];

