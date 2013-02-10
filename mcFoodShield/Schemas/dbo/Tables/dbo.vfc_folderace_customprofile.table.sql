CREATE TABLE [dbo].[vfc_folderace_customprofile] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [iprofileid]    INT           NOT NULL,
    [sprofilevalue] NVARCHAR (55) NOT NULL,
    [folderid]      INT           NOT NULL
);

