CREATE TABLE [dbo].[ReportsAvailableOptions] (
    [optionsID]     INT            IDENTITY (1, 1) NOT NULL,
    [label]         NVARCHAR (200) NOT NULL,
    [description]   NVARCHAR (500) NULL,
    [displayOrder]  INT            NULL,
    [default]       BIT            NULL,
    [VariableLabel] NVARCHAR (50)  NULL
);

