CREATE TABLE [dbo].[preso_slides] (
    [id]                  INT             NULL,
    [pathToSlideMedia]    NVARCHAR (500)  NULL,
    [height]              INT             NULL,
    [pathToSlideThumb]    NVARCHAR (500)  NULL,
    [pathToSlide]         NVARCHAR (500)  NULL,
    [width]               INT             NULL,
    [updatedOn]           DATETIME2 (7)   NULL,
    [createdOn]           DATETIME2 (7)   NULL,
    [text]                NVARCHAR (MAX)  NULL,
    [slideNumber]         INT             NULL,
    [externalMediaID]     NVARCHAR (1000) NULL,
    [hasNarration]        BIT             NULL,
    [showNotes]           BIT             NULL,
    [notes]               NVARCHAR (MAX)  NULL,
    [externalMediaSource] NVARCHAR (500)  NULL,
    [title]               NVARCHAR (500)  NULL,
    [slideshowID]         INT             NULL
);

