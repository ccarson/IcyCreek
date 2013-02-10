CREATE TABLE [dbo].[cflm_admin] (
    [sitename]        NVARCHAR (50)  NULL,
    [site_url]        NVARCHAR (100) NULL,
    [admin_email]     NVARCHAR (50)  NULL,
    [mail_server]     NVARCHAR (50)  NULL,
    [askpricing]      FLOAT          NOT NULL,
    [askversion]      FLOAT          NOT NULL,
    [requireapproval] FLOAT          NOT NULL,
    [numberresults]   FLOAT          NULL,
    [subcat_list_num] FLOAT          NULL,
    [HeaderHTML]      NVARCHAR (MAX) NULL
);

