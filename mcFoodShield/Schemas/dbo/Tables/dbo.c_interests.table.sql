CREATE TABLE [dbo].[c_interests] (
    [id]         INT           IDENTITY (2, 1) NOT NULL,
    [typename]   NVARCHAR (50) NOT NULL,
    [active]     BIT           NOT NULL,
    [isystem_id] INT           NOT NULL
);

