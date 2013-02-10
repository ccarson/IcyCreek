CREATE TABLE [dbo].[c_updates] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [sUpdateName] NVARCHAR (50) NOT NULL,
    [sScriptName] NVARCHAR (50) NOT NULL,
    [bActive]     BIT           NOT NULL
);

