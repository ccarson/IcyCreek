CREATE NONCLUSTERED INDEX [_dta_index_transitionIdentities_38_1662433492__K3_K1_K2_4]
    ON [dbo].[transitionIdentities]([convertedTableID] ASC, [id] ASC, [transitionSystemsID] ASC)
    INCLUDE([legacyID]) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

