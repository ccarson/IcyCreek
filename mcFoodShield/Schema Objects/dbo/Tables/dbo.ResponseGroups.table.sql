﻿CREATE TABLE [dbo].[ResponseGroups] (
    [responseGroupsID] UNIQUEIDENTIFIER NOT NULL,
    [responsesID]      UNIQUEIDENTIFIER NOT NULL,
    [reportGroupsID]   UNIQUEIDENTIFIER NOT NULL,
    [cdCreatedBy]      INT              NOT NULL,
    [cdCreatedOn]      DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]      INT              NULL,
    [cdUpdatedOn]      DATETIME2 (0)    NULL,
    [cdChangeReason]   NVARCHAR (50)    NULL,
    [active]           BIT              NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains a collection of responses for each report group in a given report and response.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroups';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroups', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroups', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroups', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroups', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroups', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

