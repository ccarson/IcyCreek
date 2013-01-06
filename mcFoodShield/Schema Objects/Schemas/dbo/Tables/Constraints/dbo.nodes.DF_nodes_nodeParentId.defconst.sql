ALTER TABLE [dbo].[nodes]
    ADD CONSTRAINT [DF_nodes_nodeParentId] DEFAULT ((0)) FOR [nodeParentId];

