
CREATE PROCEDURE [SAMCO].[sp_MergeBBSEC]
AS
BEGIN

	BEGIN TRY
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON
	
		-- First do the deletes for updates and deletes
		DELETE FROM [SAMCO].[BB_SEC]
		WHERE ID in (SELECT ID FROM [SAMCO].[BB_SEC_Journal]);

		-- Then do the inserts for updates and inserts
		INSERT INTO [SAMCO].[BB_SEC]
		SELECT * FROM [SAMCO].[BB_SEC_Staging] WHERE ID in (SELECT ID FROM [SAMCO].[BB_SEC_Journal] WHERE journal_operation in ('UPD','INS'));

		-- Clear the staging and journal table
		TRUNCATE TABLE [SAMCO].[BB_SEC_Staging];
		TRUNCATE TABLE [SAMCO].[BB_SEC_Journal];
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage    NVARCHAR(4000)
				,@ErrorSeverity  INT
				,@ErrorState     INT
			    ,@ErrorProcedure NVARCHAR(128)

		SELECT  @ErrorMessage   = ERROR_MESSAGE(),
				@ErrorSeverity  = ERROR_SEVERITY(),
				@ErrorState     = ERROR_STATE(),
				@ErrorProcedure = ERROR_PROCEDURE();

		RAISERROR (@ErrorMessage,   
				   @ErrorSeverity,
				   @ErrorState,
				   @ErrorProcedure);
	END CATCH
END;