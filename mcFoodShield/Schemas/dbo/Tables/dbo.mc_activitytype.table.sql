CREATE TABLE [dbo].[mc_activitytype] (
    [id]       INT           IDENTITY (3, 1) NOT NULL,
    [typename] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL
);

