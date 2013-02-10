CREATE TABLE [dbo].[c_frequency] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [frequency]  NVARCHAR (25) NOT NULL,
    [active]     BIT           NOT NULL,
    [freq_value] INT           NOT NULL
);

