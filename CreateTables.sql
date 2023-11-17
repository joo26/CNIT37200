CREATE TABLE VideoInfo (
    videoID INT PRIMARY KEY,
    title VARCHAR2(255),
    uploadDate DATE,
    viewCount INT
);

CREATE TABLE AudienceInfo (
    audienceID INT PRIMARY KEY,
    videoID INT REFERENCES VideoInfo(videoID),
    ageGroup VARCHAR2(50),
    location VARCHAR2(255) 
);

CREATE TABLE EngagementMetrics (
    metricID INT PRIMARY KEY,
    videoID INT REFERENCES VideoInfo(videoID),
    likes INT,
    dislikes INT,
    comments INT
);



