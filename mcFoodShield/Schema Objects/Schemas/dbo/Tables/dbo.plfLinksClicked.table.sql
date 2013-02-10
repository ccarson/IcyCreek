CREATE TABLE [dbo].[plfLinksClicked] (
    [plfLinksClickedId]    INT            IDENTITY (1, 1) NOT NULL,
    [plfLinksClickedLink]  NVARCHAR (255) NULL,
    [campaignId]           INT            NULL,
    [plfLinksClickedCount] INT            NULL
);

