CREATE TABLE [dbo].[meetings_roles] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [sRoleName] NVARCHAR (50) NOT NULL,
    [bActive]   BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

