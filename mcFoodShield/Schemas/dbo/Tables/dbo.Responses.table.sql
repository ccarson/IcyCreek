CREATE TABLE [dbo].[Responses] (
    [responsesID]        UNIQUEIDENTIFIER NOT NULL,
    [reportsID]          UNIQUEIDENTIFIER NOT NULL,
    [responseDisplayID]  INT              IDENTITY (1, 1) NOT NULL,
    [isActive]           BIT              NOT NULL,
    [responseClosedDate] DATETIME2 (0)    NULL,
    [cdCreatedBy]        INT              NOT NULL,
    [cdCreatedOn]        DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]        INT              NULL,
    [cdUpdatedOn]        DATETIME2 (0)    NULL,
    [cdChangeReason]     NVARCHAR (50)    NULL,
    [reportVersionID]    UNIQUEIDENTIFIER NULL,
    [isEditable]         BIT              NOT NULL,
    [isDemo]             BIT              NOT NULL,
    [groupID]            INT              NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains an individual response for a given report.  When a user completes a report form, that completion is a response.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Responses';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Responses', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Responses', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Responses', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Responses', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Responses', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

