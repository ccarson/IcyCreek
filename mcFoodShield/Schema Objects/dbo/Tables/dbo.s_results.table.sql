CREATE TABLE [dbo].[s_results] (
    [owneridfk]    NVARCHAR (255) NOT NULL,
    [questionidfk] NVARCHAR (35)  NOT NULL,
    [answeridfk]   NVARCHAR (35)  NULL,
    [truefalse]    BIT            NULL,
    [textbox]      NVARCHAR (255) NULL,
    [textboxmulti] NVARCHAR (MAX) NULL,
    [other]        NVARCHAR (255) NULL,
    [itemidfk]     NVARCHAR (35)  NULL
);

