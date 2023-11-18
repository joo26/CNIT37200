CREATE TABLE VideoInfo (
    videoID VARCHAR2(255) PRIMARY KEY,
    title VARCHAR2(255),
    uploadDate DATE,
    viewCount INT
);

CREATE TABLE CommentInfo (
    CommentID INT PRIMARY KEY,
    videoID VARCHAR2(255) REFERENCES VideoInfo(videoID),
    Comments VARCHAR2(1000),
    CommentLikes INT
);

CREATE TABLE EngagementMetrics (
    metricID INT PRIMARY KEY,
    videoID VARCHAR2(255) REFERENCES VideoInfo(videoID),
    likes INT,
    comments INT
);






