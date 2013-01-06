CREATE TABLE [dbo].[mtsch_opt_outs] (
    [mtsch_optOutID] INT            IDENTITY (3, 1) NOT NULL,
    [pollFK]         INT            NOT NULL,
    [userID]         INT            NOT NULL,
    [opt_out_reason] NVARCHAR (255) NULL,
    [opt_out_name]   NVARCHAR (100) NULL
);

