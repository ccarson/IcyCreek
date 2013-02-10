CREATE TABLE [dbo].[mc_meeting_conferenceinfo] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [meeting_id]   INT           NOT NULL,
    [0dial_number] VARCHAR (20)  NOT NULL,
    [access_code]  INT           NULL,
    [instructions] VARCHAR (MAX) NULL
);

