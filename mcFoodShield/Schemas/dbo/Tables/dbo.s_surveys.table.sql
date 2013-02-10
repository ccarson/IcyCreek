CREATE TABLE [dbo].[s_surveys] (
    [id]               NVARCHAR (35)  NOT NULL,
    [name]             NVARCHAR (100) NOT NULL,
    [description]      NVARCHAR (255) NOT NULL,
    [active]           BIT            NOT NULL,
    [datebegin]        DATETIME2 (0)  NULL,
    [dateend]          DATETIME2 (0)  NULL,
    [resultmailto]     NVARCHAR (50)  NULL,
    [surveypassword]   NVARCHAR (50)  NULL,
    [thankyoumsg]      NVARCHAR (MAX) NULL,
    [group_id]         INT            NOT NULL,
    [makepublic]       BIT            NOT NULL,
    [useridfk]         INT            NOT NULL,
    [templateidfk]     NVARCHAR (35)  NULL,
    [allowembed]       BIT            NOT NULL,
    [showinpubliclist] BIT            NOT NULL,
    [isystem_id]       INT            NOT NULL
);

