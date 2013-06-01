CREATE TABLE [dbo].[methodStepActions] (
    [id]                    INT            IDENTITY (1, 1) NOT NULL,
    [methodStepsID]         INT            NOT NULL,
    [methodsID]             INT            NOT NULL,
    [name]                  NVARCHAR (200) NOT NULL,
    [displayOrder]          INT            NOT NULL,
    [excerpt]               NVARCHAR (MAX) NOT NULL,
    [isActive]              BIT            NOT NULL,
    [parentActionsID]       INT            NOT NULL,
    [jumpToStepLevel]       NVARCHAR (1)   NOT NULL,
    [jumpToStepID]          INT            NOT NULL,
    [nodeType]              NVARCHAR (20)  NOT NULL,
    [RelationshipDirection] NVARCHAR (20)  NOT NULL,
    [stepLevel]             INT            NOT NULL
);

