﻿ALTER TABLE [dbo].[mc_contact_payments]
    ADD CONSTRAINT [DF_mc_contact_payments_term_id] DEFAULT ('0') FOR [term_id];

