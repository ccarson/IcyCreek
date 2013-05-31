CREATE TABLE [dbo].[OrgDepartmentSystems] (
    [ID]                   UNIQUEIDENTIFIER NOT NULL,
    [systemID]             INT              NOT NULL,
    [isFERNActive]         BIT              NULL,
    [isMicro]              BIT              NULL,
    [isChem]               BIT              NULL,
    [isRad]                BIT              NULL,
    [isSearchable]         BIT              CONSTRAINT [DF_OrgDepartmentSystems_isSearchable] DEFAULT ((1)) NULL,
    [microAcceptedOn]      DATETIME2 (7)    NULL,
    [microWithdrawOn]      DATETIME2 (7)    NULL,
    [chemAcceptedOn]       DATETIME2 (7)    NULL,
    [chemWithdrawOn]       DATETIME2 (7)    NULL,
    [radAcceptedOn]        DATETIME2 (7)    NULL,
    [radWithdrawOn]        DATETIME2 (7)    NULL,
    [createdOn]            DATETIME2 (7)    NULL,
    [createdBy]            UNIQUEIDENTIFIER NULL,
    [updatedOn]            DATETIME2 (7)    NULL,
    [updatedBy]            UNIQUEIDENTIFIER NULL,
    [mc_org_departmentsID] INT              NOT NULL,
    CONSTRAINT [PK_OrgDepartmentSystems] PRIMARY KEY CLUSTERED ([ID] ASC, [systemID] ASC),
    CONSTRAINT [FK_OrgDepartmentSystems_OrgDepartments] FOREIGN KEY ([ID]) REFERENCES [dbo].[OrgDepartments] ([id]),
    CONSTRAINT [FK_OrgDepartmentSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [Reference].[Systems] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IX_OrgDepartmentsSystems_Core]
    ON [dbo].[OrgDepartmentSystems]([ID] ASC, [systemID] ASC, [mc_org_departmentsID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_OrgDepartmentSystems]
    ON [dbo].[OrgDepartmentSystems]([systemID] ASC, [mc_org_departmentsID] ASC)
    INCLUDE([ID]);

