/* videos with most comments - (Question 1) Stewart */
select videoinfo.videoid, sum(commentinfo.comments) as comment_total
from videoinfo join commentinfo on videoinfo.videoid = commentinfo.videoid
group by videoinfo.videoid
order by comment_total desc;

/* average_view_count for each video - (Question 2) Minseong */
SELECT videoID,ROUND(AVG(viewCount), 2) AS averageViewCount
FROM VideoInfo
GROUP BY videoID
ORDER BY averageViewCount DESC;

/* top 3 videos with lowest 3 with the least comments - (Question 3) Minseong */
SELECT c.videoID, v.title, COUNT(c.CommentID) AS commentCount
FROM CommentInfo c
JOIN VideoInfo v ON c.videoID = v.videoID
GROUP BY c.videoID, v.title
ORDER BY commentCount ASC
FETCH FIRST 3 ROWS ONLY;

/* Output the top 3 most watched videos, select the videoID, the title, and the viewcount. Do the same for the 3 most least watched videos. - (Question 4) Stewart*/
select videoid, title, viewcount 
from videoinfo
order by viewcount desc
fetch first 3 rows only; 

select videoid, title, viewcount 
from videoinfo
order by viewcount asc
fetch first 3 rows only; 

/*top 3 videos with the most comments - (Question 5) Minseong */
SELECT c.videoID, v.title, COUNT(c.CommentID) AS commentCount
FROM CommentInfo c
JOIN VideoInfo v ON c.videoID = v.videoID
GROUP BY c.videoID, v.title
ORDER BY commentCount DESC
FETCH FIRST 3 ROWS ONLY;

/* correlation between video popularity and upload date - (Question 6) Stewart*/
select to_char(uploaddate, 'DD-MON-YYYY') as date_uploaded, avg(viewcount) as average_views
from videoinfo
group by to_char(uploaddate, 'DD-MON-YYYY')
order by to_char(uploaddate, 'DD-MON-YYYY');

/* most popular upload date - (Question 7) Stewart */ 

select to_char(uploaddate, 'DD-MON-YYYY') as date_uploaded, count(*) upload_count
from videoinfo
group by to_char(uploaddate, 'DD-MON-YYYY')
order by upload_count desc
fetch first 1 row only;

/* video with the most engagement (likes + comments) - (Question 8) Minseong */
SELECT e.videoID, v.title, (e.likes + e.comments) AS totalEngagement
FROM EngagementMetrics e JOIN VideoInfo v 
ON e.videoID = v.videoID
ORDER BY totalEngagement DESC
FETCH FIRST 1 ROW ONLY;


/* Query that outputs the total_viewcount of a specified video. It outputs the title of the video, and the number of views recorded. - (Question 10) Stewart */

SET SERVEROUTPUT ON;

DECLARE
    v_videoid VARCHAR2(255) := 'XYZ';
    v_total_viewcount INT;
    v_video_title varchar2(500);

BEGIN
    select videoid, title, sum(viewcount)
    into v_video_title, v_total_viewcount
    from videoinfo
    where videoid = v_videoid
    group by title;

    DBMS_OUTPUT.PUT_LINE(v_video_title);
    DBMS_OUTPUT.PUT_LINE(v_total_viewcount);
END;
	
	
	






