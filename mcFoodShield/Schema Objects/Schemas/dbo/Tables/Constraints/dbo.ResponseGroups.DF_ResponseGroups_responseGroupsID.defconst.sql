ALTER TABLE [dbo].[ResponseGroups]
    ADD CONSTRAINT [DF_ResponseGroups_responseGroupsID] DEFAULT (newsequentialid()) FOR [responseGroupsID];

