CREATE TABLE [dbo].[OrgDepartments] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [name]               NVARCHAR (270)   NULL,
    [organizationID]     UNIQUEIDENTIFIER NOT NULL,
    [orgLocationID]      UNIQUEIDENTIFIER NOT NULL,
    [parentDepartmentID] UNIQUEIDENTIFIER NULL,
    [orgLevel]           INT              NULL,
    [isActive]           BIT              CONSTRAINT [DF_OrgDepartments_isActive] DEFAULT ((1)) NULL,
    [notes]              NVARCHAR (MAX)   NULL,
    [website]            NVARCHAR (MAX)   NULL,
    [createdOn]          DATETIME2 (7)    NULL,
    [createdBy]          UNIQUEIDENTIFIER NULL,
    [updatedOn]          DATETIME2 (7)    NULL,
    [updatedBy]          UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_OrgDepartments] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_OrgDepartments_Organizations] FOREIGN KEY ([organizationID]) REFERENCES [dbo].[Organizations] ([id])
);




GO
CREATE NONCLUSTERED INDEX [IX_OrgDepartments_OrgData]
    ON [dbo].[OrgDepartments]([organizationID] ASC, [orgLocationID] ASC, [id] ASC, [name] ASC);

