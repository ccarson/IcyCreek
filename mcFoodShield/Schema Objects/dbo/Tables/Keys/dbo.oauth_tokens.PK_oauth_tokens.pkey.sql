﻿ALTER TABLE [dbo].[oauth_tokens]
    ADD CONSTRAINT [PK_oauth_tokens] PRIMARY KEY CLUSTERED ([tkey] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
