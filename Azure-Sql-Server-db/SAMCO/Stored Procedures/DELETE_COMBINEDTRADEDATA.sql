-- Create the stored procedure in the specified schema
CREATE PROCEDURE SAMCO.DELETE_COMBINEDTRADEDATA
    @table_name varchar(100),
    @col_name  varchar(100)
 

-- add more stored procedure parameters here
AS
BEGIN


DECLARE @SQLString NVARCHAR(200),
        @tablename nvarchar(50),
        @columnname nvarchar(50),
        @todaydate varchar(20) = casT(getdate() as date),
        @ParmDefinition nvarchar(500) = N'@todaydate date' 

SET @SQLString =  
     N'DELETE FROM '+@table_name + 'WHERE cast('+@col_name+' as date) = @todaydate'  

/* Execute the string with the first parameter value. */  
BEGIN TRY

EXECUTE sp_executesql @SQLString, @ParmDefinition,  
                      @todaydate = @todaydate 

--SELECT 'TESTEND' ,  @SQLString AS SQLString , @ParmDefinition as ParmDefinition , @col_name as col_name,@todaydate as todaydate

END TRY
BEGIN CATCH
DECLARE     @ErrorMessage NVARCHAR(4000)
            ,@ErrorSeverity INT
            ,@ErrorState INT
            ,@ErrorProcedure NVARCHAR(128)

SELECT  @ErrorMessage   =   ERROR_MESSAGE(),
        @ErrorSeverity  =   ERROR_SEVERITY(),
        @ErrorState     =   ERROR_STATE(),
        @ErrorProcedure =   ERROR_PROCEDURE();

RAISERROR (@ErrorMessage,   
           @ErrorSeverity,
           @ErrorState,
           @ErrorProcedure)
END CATCH;

SET NOCOUNT OFF;

END

-- DELETE FROM '+@table_name + 'WHERE cast('+@col_name+' as date)
-- delete from [SAMCO].[SCD_FXTRANSACTIONDATA] where cast ([TRADE_DATE] as date) = '2020-08-10'