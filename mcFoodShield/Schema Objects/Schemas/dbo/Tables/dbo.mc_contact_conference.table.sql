CREATE TABLE [dbo].[mc_contact_conference] (
    [id]                INT            IDENTITY (188, 1) NOT NULL,
    [event_id]          INT            NOT NULL,
    [user_id]           INT            NOT NULL,
    [badge_name]        NVARCHAR (255) NULL,
    [title]             NVARCHAR (255) NOT NULL,
    [degrees]           NVARCHAR (255) NULL,
    [location_id]       INT            NOT NULL,
    [phone_id]          INT            NOT NULL,
    [fax_id]            INT            NOT NULL,
    [email_id]          INT            NOT NULL,
    [added_date]        DATETIME2 (0)  NULL,
    [added_by]          INT            NOT NULL,
    [late_registration] BIT            NOT NULL,
    [confirm_pdf]       NVARCHAR (500) NULL
);

