USE DotNetCourseDatabase
GO

CREATE OR ALTER PROC TutorialAppSchema.spUser_Delete
    @UserId INT
AS
BEGIN
    DELETE FROM [TutorialAppSchema].[Users] 
    WHERE 
        UserId = @UserId

    DELETE FROM [TutorialAppSchema].[UserJobInfo] 
    WHERE 
        UserId = @UserId

    DELETE FROM [TutorialAppSchema].[UserSalary] 
    WHERE 
        UserId = @UserId
END