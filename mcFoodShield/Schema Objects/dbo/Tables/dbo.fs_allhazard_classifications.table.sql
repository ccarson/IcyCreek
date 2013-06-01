CREATE TABLE [dbo].[fs_allhazard_classifications] (
    [id]             INT           IDENTITY (4, 1) NOT NULL,
    [classification] NVARCHAR (50) NULL,
    [active]         BIT           NOT NULL
);

