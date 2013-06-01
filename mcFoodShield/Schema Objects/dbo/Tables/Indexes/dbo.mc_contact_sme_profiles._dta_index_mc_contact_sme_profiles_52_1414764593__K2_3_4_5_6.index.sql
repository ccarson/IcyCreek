CREATE NONCLUSTERED INDEX [_dta_index_mc_contact_sme_profiles_52_1414764593__K2_3_4_5_6]
    ON [dbo].[mc_contact_sme_profiles]([userID] ASC)
    INCLUDE([areasOfExpertise], [discipline], [experience], [methodologiesTools]) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

