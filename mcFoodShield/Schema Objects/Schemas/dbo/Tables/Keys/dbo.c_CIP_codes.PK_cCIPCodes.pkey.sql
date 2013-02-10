ALTER TABLE [dbo].[c_CIP_codes]
    ADD CONSTRAINT [PK_cCIPCodes] PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'primary key', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'c_CIP_codes', @level2type = N'CONSTRAINT', @level2name = N'PK_cCIPCodes';

