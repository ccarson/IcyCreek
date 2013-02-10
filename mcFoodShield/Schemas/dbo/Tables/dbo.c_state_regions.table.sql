CREATE TABLE [dbo].[c_state_regions] (
    [state] NVARCHAR (2)  NOT NULL,
    [id]    INT           IDENTITY (97, 1) NOT NULL,
    [usda]  NVARCHAR (50) NULL,
    [fda]   NVARCHAR (50) NULL,
    [epa]   NVARCHAR (50) NULL,
    [aphis] NVARCHAR (50) NULL
);

