
CREATE PROCEDURE [SAMCO].[sp_TruncateBBSEC]
AS
BEGIN
	BEGIN TRY
		-- Clean-up the BB_SEC table
		TRUNCATE TABLE [SAMCO].[BB_SEC];

		-- And clear the staging and journal table
		TRUNCATE TABLE [SAMCO].[BB_SEC_Staging];
		TRUNCATE TABLE [SAMCO].[BB_SEC_Journal];
	END TRY

	BEGIN CATCH
		-- Do nothing, when table does not exists it is created by the pipeline
	END CATCH
END;