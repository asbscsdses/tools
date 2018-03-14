SELECT * FROM dbo.ExceptionAlarm

DELETE FROM dbo.ExceptionAlarm

UPDATE dbo.ExceptionAlarm SET CreateDate=GETDATE() WHERE ID IN (SELECT TOP 1000 ID FROM dbo.ExceptionAlarm ORDER BY ID)

SELECT TOP 1000 * FROM dbo.ExceptionAlarm ORDER BY ID


DECLARE  @Limit    INT,
         @RowNum   INT,
         @Id		INT 

SET @Limit = 1000

SELECT TOP 1 @Id = ID FROM dbo.ExceptionAlarm ORDER BY ID

SET @RowNum = 0 

WHILE @RowNum < @Limit

  BEGIN	
    SET @RowNum = @RowNum + 1    
    
    PRINT @RowNum

    UPDATE dbo.ExceptionAlarm SET CreateDate=GETDATE() WHERE ID=@Id

    SELECT TOP 1 @Id = ID FROM dbo.ExceptionAlarm WHERE ID>@Id ORDER BY ID
  END -- while