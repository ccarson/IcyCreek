CREATE TABLE [dbo].[sso_accounts] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [site]        NVARCHAR (500) NOT NULL,
    [account_id]  NVARCHAR (50)  NOT NULL,
    [account_key] NVARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

