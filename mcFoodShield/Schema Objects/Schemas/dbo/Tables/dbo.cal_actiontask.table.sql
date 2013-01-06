CREATE TABLE [dbo].[cal_actiontask] (
    [TaskID]          INT            IDENTITY (2, 1) NOT NULL,
    [TaskDescription] NVARCHAR (255) NULL,
    [inactive]        BIT            NOT NULL,
    [TaskColor]       NVARCHAR (10)  NULL
);

