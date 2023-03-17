USE DotNetCourseDatabase
GO

CREATE OR ALTER PROC TutorialAppSchema.spPosts_Delete
    @PostId INT,
    @UserId INT
AS
BEGIN
    DELETE FROM TutorialAppSchema.Posts 
    WHERE
        PostId = @PostId
    AND
        UserId = @UserId
END