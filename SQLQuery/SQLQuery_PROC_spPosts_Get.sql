USE DotNetCourseDatabase
GO

CREATE OR ALTER PROC TutorialAppSchema.spPosts_Get
    @UserId INT = NULL, 
    @SearchValue NVARCHAR(MAX) = NULL,
    @PostId INT = NULL
AS
BEGIN
    SELECT 
        [Posts].[PostId],
        [Posts].[UserId],
        [Posts].[PostTitle],
        [Posts].[PostContent],
        [Posts].[PostCreated],
        [Posts].[PostUpdate] 
    FROM 
        TutorialAppSchema.Posts AS Posts
    WHERE
        Posts.UserId = ISNULL(@UserId, Posts.UserId)
    AND
        Posts.PostId = ISNULL(@PostId, Posts.PostId)
    AND
        (@SearchValue IS NULL
        OR Posts.PostContent LIKE '%' + @SearchValue + '%'
        OR Posts.PostTitle LIKE '%' + @SearchValue + '%')
END

EXEC TutorialAppSchema.spPosts_Get 
@UserId = 1003
, 
@PostId = 1
,
@SearchValue = 'post'
