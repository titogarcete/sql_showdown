BEGIN TRANSACTION;

DECLARE @DeletedRows INT;

-- Delete comments made by users with less than 100 reputation
DELETE FROM Comments
WHERE UserId IN (
    SELECT Id
    FROM Users
    WHERE Reputation < 100
);

-- Store the number of deleted rows
SET @DeletedRows = @@ROWCOUNT;

-- Check if any rows were deleted and print the appropriate message
IF @DeletedRows > 0
BEGIN
    PRINT CAST(@DeletedRows AS VARCHAR) + ' comments were deleted.';
END
ELSE
BEGIN
    PRINT 'No comments were deleted.';
END

COMMIT TRANSACTION;
