CREATE TRIGGER [dbo].[mc_groups_news$timestamp]
   ON [dbo].[mc_groups_news]
    AFTER UPDATE
      AS 
         BEGIN

            SET  NOCOUNT  ON

            UPDATE dbo.mc_groups_news
               SET 
                  dtCreated = getdate()
            FROM 
               dbo.mc_groups_news  AS t 
                  JOIN inserted  AS i 
                  ON t.id=i.id
            WHERE NOT UPDATE(dtCreated) OR i.dtCreated IS NULL

         END
