CREATE NONCLUSTERED INDEX [_dta_index_mc_groups_archives_5_757069933__K2_K1_4_7]
    ON [dbo].[mc_groups_archives]([group_id] ASC, [id] ASC)
    INCLUDE([dateCreated], [sSubject]) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

