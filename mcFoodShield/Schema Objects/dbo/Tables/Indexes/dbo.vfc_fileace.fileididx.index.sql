CREATE NONCLUSTERED INDEX [fileididx]
    ON [dbo].[vfc_fileace]([FileID] ASC)
    INCLUDE([igrouproleid]);



