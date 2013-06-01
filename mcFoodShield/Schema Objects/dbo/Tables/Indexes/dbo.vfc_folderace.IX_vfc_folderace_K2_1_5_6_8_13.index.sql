CREATE NONCLUSTERED INDEX [IX_vfc_folderace_K2_1_5_6_8_13]
    ON [dbo].[vfc_folderace]([UserGroupID] ASC)
    INCLUDE([FolderID], [icustgrouproleid], [igrouproleid], [iminigroupid], [inetworkid]) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

