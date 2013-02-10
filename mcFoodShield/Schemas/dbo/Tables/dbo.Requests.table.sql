CREATE TABLE [dbo].[Requests] (
    [requestsID]     UNIQUEIDENTIFIER NOT NULL,
    [title]          NVARCHAR (50)    NOT NULL,
    [description]    NVARCHAR (100)   NOT NULL,
    [requestedBy]    INT              NOT NULL,
    [requestDate]    DATETIME2 (0)    NOT NULL,
    [lastRunBy]      INT              NOT NULL,
    [lastRunDate]    DATETIME2 (0)    NOT NULL,
    [cdCreatedBy]    INT              NOT NULL,
    [cdCreatedOn]    DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]    INT              NULL,
    [cdUpdatedOn]    DATETIME2 (0)    NULL,
    [cdChangeReason] NVARCHAR (50)    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains search requests for a given report.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Requests';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Requests', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Requests', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Requests', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Requests', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Requests', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

