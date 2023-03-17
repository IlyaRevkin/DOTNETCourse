USE DotNetCourseDatabase
GO

CREATE OR ALTER PROC TutorialAppSchema.spPosts_Upsert
    @PostId INT,
    @UserId INT,
    @PostTitle NVARCHAR(255),
    @PostContent NVARCHAR(MAX)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM TutorialAppSchema.Posts WHERE PostId = @PostId)
        BEGIN
            INSERT INTO TutorialAppSchema.Posts(
                [UserId],
                [PostTitle],
                [PostContent],
                [PostCreated],
                [PostUpdate]
            ) VALUES(
                @UserId,
                @PostTitle,
                @PostContent,
                GETDATE(),
                GETDATE()
            )
        END
    ELSE
        BEGIN
            UPDATE TutorialAppSchema.Posts SET
                PostTitle = @PostTitle,
                PostContent = @PostContent,
                PostUpdate = GETDATE()
            WHERE
                PostId = @PostId
        END
END