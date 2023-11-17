CREATE TABLE VideoInfo (
    videoID INT PRIMARY KEY,
    title VARCHAR2(255),
    uploadDate DATE,
    viewCount INT
);

CREATE TABLE CommentInfo (
    CommentID INT PRIMARY KEY,
    videoID INT REFERENCES VideoInfo(videoID),
    Comment VARCHAR2(1000),
    CommentLikes INT
);

CREATE TABLE EngagementMetrics (
    metricID INT PRIMARY KEY,
    videoID INT REFERENCES VideoInfo(videoID),
    likes INT,
    dislikes INT,
    comments INT
);




