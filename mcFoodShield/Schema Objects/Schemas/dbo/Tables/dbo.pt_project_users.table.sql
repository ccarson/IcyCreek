﻿CREATE TABLE [dbo].[pt_project_users] (
    [userID]         NCHAR (35) NOT NULL,
    [projectID]      NCHAR (35) NOT NULL,
    [admin]          BIT        NULL,
    [file_view]      INT        NULL,
    [file_edit]      INT        NULL,
    [file_comment]   INT        NULL,
    [issue_view]     INT        NULL,
    [issue_edit]     INT        NULL,
    [issue_assign]   INT        NULL,
    [issue_resolve]  INT        NULL,
    [issue_close]    INT        NULL,
    [issue_comment]  INT        NULL,
    [msg_view]       INT        NULL,
    [msg_edit]       INT        NULL,
    [msg_comment]    INT        NULL,
    [mstone_view]    INT        NULL,
    [mstone_edit]    INT        NULL,
    [mstone_comment] INT        NULL,
    [todolist_view]  INT        NULL,
    [todolist_edit]  INT        NULL,
    [todo_edit]      INT        NULL,
    [todo_comment]   INT        NULL,
    [time_view]      INT        NULL,
    [time_edit]      INT        NULL,
    [bill_view]      INT        NULL,
    [bill_edit]      INT        NULL,
    [bill_rates]     INT        NULL,
    [bill_invoices]  INT        NULL,
    [bill_markpaid]  INT        NULL,
    [report]         INT        NULL,
    [svn]            INT        NULL
);

