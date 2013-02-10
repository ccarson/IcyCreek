CREATE TABLE [dbo].[c_CIP_codes] (
    [id]             INT            IDENTITY (1, 1) NOT NULL,
    [cCIPFamiliesID] INT            NOT NULL,
    [cipCode]        NVARCHAR (7)   NOT NULL,
    [reportUnder]    NVARCHAR (7)   NULL,
    [title]          NVARCHAR (250) NULL,
    [description]    NVARCHAR (MAX) NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The Classification of Instructional Programs (CIP) provides a taxonomic scheme that supports the accurate tracking, assessment, and reporting of fields of study and program completions activity.
	
This is also known as CIP2000.  

CIP2000 codes are used in SME to track degree and certificate studies.  

These codes can also be used to design an SME survey, or to create an SME Category for searching.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) identifier for the CIP2000 family code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'COLUMN', @level2name = N'cCIPFamiliesID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'CIP2000 code that designates a specific area of study', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'COLUMN', @level2name = N'cipCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'some CIP codes are reported under other codes for statisical purposes -- not used in SME database', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'COLUMN', @level2name = N'reportUnder';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'short description of CIP code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'COLUMN', @level2name = N'title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'extended description of CIP code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'COLUMN', @level2name = N'description';

