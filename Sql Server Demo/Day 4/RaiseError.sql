BEGIN TRY
    -- Generate Age Exception error.
    Declare @age int
    set @age=12
    if @age>18 AND @age<=60
       select @age
    else
      RAISERROR
    (N'Age cant be less then 18 or greater than 60',
    18, -- Severity.
    1 -- State.
    )
END TRY
BEGIN CATCH
    -- Execute the error retrieval routine.
    EXECUTE spGetErrorInfo;
END CATCH;
GO