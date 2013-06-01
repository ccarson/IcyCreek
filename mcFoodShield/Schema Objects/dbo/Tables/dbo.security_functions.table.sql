CREATE TABLE [dbo].[security_functions] (
    [id]        INT           IDENTITY (7, 1) NOT NULL,
    [func_id]   INT           NOT NULL,
    [func_name] NVARCHAR (50) NOT NULL,
    [active]    BIT           NOT NULL
);

