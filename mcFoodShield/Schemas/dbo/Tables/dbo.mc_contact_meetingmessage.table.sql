CREATE TABLE [dbo].[mc_contact_meetingmessage] (
    [id]           INT           IDENTITY (5846, 1) NOT NULL,
    [meeting_id]   INT           NOT NULL,
    [user_id]      INT           NOT NULL,
    [message_date] DATETIME2 (0) NULL
);

