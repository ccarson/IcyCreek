CREATE TABLE [dbo].[c_colleges_universities] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [name]       NVARCHAR (255) NULL,
    [address]    NVARCHAR (255) NULL,
    [city]       NVARCHAR (255) NULL,
    [stateAbbr]  NVARCHAR (255) NULL,
    [ZIPcode]    NVARCHAR (255) NULL,
    [province]   NVARCHAR (255) NULL,
    [country]    NVARCHAR (255) NULL,
    [postalCode] NVARCHAR (255) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Codes list containing all United States colleges and universities.

Includes some foreign colleges and universities.

List is based on data provided by FAFSA current list of schools.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'institution name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'address', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'city', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'city';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'state', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'stateAbbr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'zip code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'ZIPcode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'province ( if Canadian )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'province';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'country', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'country';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'postal Code ( if foreign )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_colleges_universities', @level2type = N'COLUMN', @level2name = N'postalCode';

