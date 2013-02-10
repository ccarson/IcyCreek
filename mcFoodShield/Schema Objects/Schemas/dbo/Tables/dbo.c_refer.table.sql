CREATE TABLE [dbo].[c_refer] (
    [id]         INT           IDENTITY (2, 1) NOT NULL,
    [refername]  NVARCHAR (25) NOT NULL,
    [active]     BIT           NOT NULL,
    [isystem_id] INT           NOT NULL
);

