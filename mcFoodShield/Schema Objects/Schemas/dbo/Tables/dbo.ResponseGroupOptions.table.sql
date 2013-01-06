CREATE TABLE [dbo].[ResponseGroupOptions] (
    [responseGroupOptionsID] UNIQUEIDENTIFIER NOT NULL,
    [responseGroupsID]       UNIQUEIDENTIFIER NOT NULL,
    [reportGroupOptionsID]   UNIQUEIDENTIFIER NOT NULL,
    [responseValue]          NVARCHAR (500)   NULL,
    [responseValue2]         NVARCHAR (500)   NULL,
    [cdCreatedBy]            INT              NOT NULL,
    [cdCreatedOn]            DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]            INT              NULL,
    [cdUpdatedOn]            DATETIME2 (0)    NULL,
    [cdChangeReason]         NVARCHAR (500)   NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains the selected options for a given response.  Because report groups can repeat inside a given response, the report group to which the options correspond is also recorded.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroupOptions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroupOptions', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroupOptions', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroupOptions', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroupOptions', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ResponseGroupOptions', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

