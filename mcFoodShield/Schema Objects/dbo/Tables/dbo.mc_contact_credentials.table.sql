CREATE TABLE [dbo].[mc_contact_credentials] (
    [id]                      INT           IDENTITY (1, 1) NOT NULL,
    [smeExpertsID]            INT           NOT NULL,
    [cCollegesUniversitiesID] INT           NOT NULL,
    [cDegreesID]              INT           NOT NULL,
    [degreeCertificateTitle]  NVARCHAR (20) NOT NULL,
    [cCIPCodes_Major]         INT           NOT NULL,
    [cCIPCodes_Minor]         INT           NULL,
    [distinctions]            NVARCHAR (50) NOT NULL,
    [awardedYear]             INT           NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'academic credentials awarded to smeExperts', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) identifier for the smeExpert who holds the credential', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'smeExpertsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) identifier for the institution that awarded the credential', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'cCollegesUniversitiesID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) identifer for the level of the credential', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'cDegreesID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'title of the credential ( MD, BA, BPharm, MSEE, etc. )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'degreeCertificateTitle';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'CIP2000 code that defines the major area of study', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'cCIPCodes_Major';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'CIP2000 code that defines the minor ( if minor is available )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'cCIPCodes_Minor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'distinctions awarded with the credential ( e.g., cum laude, magna cum laude, with honors )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'distinctions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'year in which the credential was awarded', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'mc_contact_credentials', @level2type = N'COLUMN', @level2name = N'awardedYear';

