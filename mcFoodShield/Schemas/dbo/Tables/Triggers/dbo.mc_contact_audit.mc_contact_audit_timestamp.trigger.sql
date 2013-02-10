CREATE TRIGGER [dbo].[mc_contact_audit$timestamp]
   ON [dbo].[mc_contact_audit]
    AFTER UPDATE
      AS 
         BEGIN

            SET  NOCOUNT  ON

            UPDATE dbo.mc_contact_audit
               SET 
                  dateCreated = getdate()
            FROM 
               dbo.mc_contact_audit  AS t 
                  JOIN inserted  AS i 
                  ON t.id=i.id
            WHERE NOT UPDATE(dateCreated) OR i.dateCreated IS NULL

         END
