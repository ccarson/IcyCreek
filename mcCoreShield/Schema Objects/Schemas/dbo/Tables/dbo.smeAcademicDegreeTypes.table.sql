CREATE TABLE [dbo].[smeAcademicDegreeTypes] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [degreeCertificate] NVARCHAR (255) NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'codes table containing levels of university degrees, certificates, and course work.

Individual degree data is captured in the smeCredentials entity.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicDegreeTypes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicDegreeTypes', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'level of degree or certificate awarded', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'smeAcademicDegreeTypes', @level2type = N'COLUMN', @level2name = N'degreeCertificate';

