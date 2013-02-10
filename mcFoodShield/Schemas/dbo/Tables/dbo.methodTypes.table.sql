CREATE TABLE [dbo].[methodTypes] (
    [id]               INT          IDENTITY (1, 1) NOT NULL,
    [MethodXLabel]     VARCHAR (50) NOT NULL,
    [PrimaryStepLabel] VARCHAR (50) NULL,
    [SubStepLabel]     VARCHAR (50) NULL,
    [GeneralStepLabel] VARCHAR (50) NULL,
    [MethodLabel]      VARCHAR (50) NULL
);

