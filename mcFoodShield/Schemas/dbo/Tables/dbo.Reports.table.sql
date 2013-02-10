CREATE TABLE [dbo].[Reports] (
    [reportsID]            UNIQUEIDENTIFIER NOT NULL,
    [title]                NVARCHAR (MAX)   NOT NULL,
    [instructions]         NVARCHAR (MAX)   NOT NULL,
    [detailedInstructions] NVARCHAR (MAX)   NULL,
    [reportingBurden]      NVARCHAR (MAX)   NULL,
    [responseIDLabel]      NVARCHAR (100)   NOT NULL,
    [isActive]             BIT              NOT NULL,
    [subTitle]             NVARCHAR (MAX)   NULL,
    [footer]               NVARCHAR (MAX)   NULL,
    [cdCreatedBy]          INT              NOT NULL,
    [cdCreatedOn]          DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]          INT              NULL,
    [cdUpdatedOn]          DATETIME2 (0)    NULL,
    [cdChangeReason]       NVARCHAR (50)    NULL,
    [alertText]            NVARCHAR (MAX)   NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains a report through which a user can enter data, modify data, or update data already entered', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Report Title', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Instructions for filling out the report', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'instructions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name for the report response ( e.g. Case Number, Survey Number, Report Number )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'responseIDLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is the current report active?', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'isActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reports', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

