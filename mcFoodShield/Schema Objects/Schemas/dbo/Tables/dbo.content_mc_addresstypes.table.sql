CREATE TABLE [dbo].[content_mc_addresstypes] (
    [id]       INT           IDENTITY (7, 1) NOT NULL,
    [typename] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

