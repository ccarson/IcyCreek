CREATE TABLE [dbo].[smeAcademicUniversities] (
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Codes list containing all United States colleges and universities.

Includes some foreign colleges and universities.

List is based on data provided by FAFSA current list of schools.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'institution name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'address', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'city', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'city';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'state', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'stateAbbr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'zip code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'ZIPcode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'province ( if Canadian )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'province';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'country', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'country';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'postal Code ( if foreign )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicUniversities', @level2type = N'COLUMN', @level2name = N'postalCode';

