CREATE TABLE [dbo].[Organizations] (
    [id]        UNIQUEIDENTIFIER NOT NULL,
    [Name]      NVARCHAR (255)   NULL,
    [Website]   NVARCHAR (255)   NULL,
    [Status]    NVARCHAR (50)    NULL,
    [Summary]   NVARCHAR (500)   NULL,
    [isActive]  BIT              NULL,
    [isDemo]    BIT              CONSTRAINT [DF_Organizations_isDemo] DEFAULT ((0)) NOT NULL,
    [isTemp]    BIT              NULL,
    [brandID]   INT              CONSTRAINT [DF_Organizations_brandID] DEFAULT ((1)) NOT NULL,
    [createdOn] DATETIME2 (7)    NULL,
    [createdBy] UNIQUEIDENTIFIER NULL,
    [updatedOn] DATETIME2 (7)    NULL,
    [updatedBy] UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_Organizations_Name]
    ON [dbo].[Organizations]([Name] ASC);

