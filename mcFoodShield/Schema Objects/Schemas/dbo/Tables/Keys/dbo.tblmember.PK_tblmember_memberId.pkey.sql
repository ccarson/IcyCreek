﻿ALTER TABLE [dbo].[tblmember]
    ADD CONSTRAINT [PK_tblmember_memberId] PRIMARY KEY CLUSTERED ([memberId] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

