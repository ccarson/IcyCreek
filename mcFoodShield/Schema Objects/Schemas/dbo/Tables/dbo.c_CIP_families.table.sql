CREATE TABLE [dbo].[c_CIP_families] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [cipFamilyCode] NVARCHAR (2)   NOT NULL,
    [cipCode]       NVARCHAR (7)   NOT NULL,
    [title]         NVARCHAR (255) NULL,
    [description]   NVARCHAR (MAX) NULL,
    [reportUnder]   NVARCHAR (7)   NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The CIP2000 codes are grouped together into Families.  Each CIP Family code represents a broader level of study than what is captured by individual CIP Codes.

Family codes are used for statistical aggregation.

Family codes can be use in the SME database for broader searches than might be available if one used only CIP Codes for searches.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'unique identifier', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'CIP Codes are grouped into families that are broad categories of more specialized CIP codes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families', @level2type = N'COLUMN', @level2name = N'cipFamilyCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'CIP Family codes also have a CIP code that is used for statistical purposes -- not used in SME database', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families', @level2type = N'COLUMN', @level2name = N'cipCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'short description of CIP family code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families', @level2type = N'COLUMN', @level2name = N'title';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'extended description of CIP family code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'some CIP codes are reported under other codes for statisical purposes -- not used in SME database', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_families', @level2type = N'COLUMN', @level2name = N'reportUnder';

