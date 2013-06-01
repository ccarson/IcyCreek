CREATE VIEW dbo.c_zip
/*
************************************************************************
      View:  dbo.c_zip
    Author:  Chris Carson
      Date:  2012-08-24
   Purpose:  retrieves portal version of coreZipCodes


revisor     date          description
---------   -----------   ----------------------------
ccarson     2012-08-24    Created


************************************************************************
*/
AS
    SELECT  TOP 100 PERCENT
            *
      FROM  mcCoreShield.Reference.ZipCodes
     ORDER  BY 1 ;
