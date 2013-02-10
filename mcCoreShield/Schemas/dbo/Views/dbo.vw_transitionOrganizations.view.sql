CREATE VIEW dbo.vw_transitionOrganizations
AS
/*
************************************************************************************************************************************

       View:    dbo.vw_transitionOrganizations
     Author:    ccarson
    Purpose:    displays data from mcCoreSHIELD.dbo.OrganizationSystems, relating coreSHIELD org to legacy dbo.mc_organzation

    Revision History:
    revisor     date            Version     description
    ---------   -----------     -------     ---------------------
    ccarson     2010-12-03      1.0         original code
    ccarson     2012-08-17      2.0         replaced references to transitionIdentities table with dbo.OrganizationSystems

    Notes:
    For coreSHIELD 2.0, transitionIdentities is replaced by a system-specific OrganizationSystems table.

************************************************************************************************************************************
*/
    SELECT  id
          , transitionSystemsID = systemID
          , OrganizationsID     = mc_organizationID
      FROM  dbo.OrganizationSystems ;

