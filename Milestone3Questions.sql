/* videos with most comments - Stewart */
select videoinfo.videoid, sum(commentinfo.comments) as comment_total
from videoinfo join commentinfo on videoinfo.videoid = commentinfo.videoid
group by videoinfo.videoid
order by comment_total desc;


/* correlation between video popularity and upload date - Stewart*/
select to_char(uploaddate, 'DD-MON-YYYY') as date_uploaded, avg(viewcount) as average_views
from videoinfo
group by to_char(uploaddate, 'DD-MON-YYYY')
order by to_char(uploaddate, 'DD-MON-YYYY');

/* most popular upload date - Stewart */ 

select to_char(uploaddate, 'DD-MON-YYYY') as date_uploaded, count(*) upload_count
from videoinfo
group by to_char(uploaddate, 'DD-MON-YYYY')
order by upload_count desc
fetch first 1 row only;



/* Question #10 : QUERY that outputs the total_viewcount of a specified video. 
It outputs the title of the video, and the number of views recorded. - Yooto */
SET SERVEROUTPUT ON;

DECLARE
    v_videoID VARCHAR2(255) := 'MnCilaL_3yo'; -- Replace with the actual videoID
    v_totalViewCount INT;
    v_videoTitle VARCHAR2(255);
BEGIN
    -- Retrieve the total view count for the specified video
    SELECT title, SUM(viewCount) 
    INTO v_videoTitle, v_totalViewCount
    FROM VideoInfo
    WHERE videoID = v_videoID
    GROUP BY title;

    -- Output the results
    DBMS_OUTPUT.PUT_LINE('Video Name: ' || v_videoTitle);
    DBMS_OUTPUT.PUT_LINE('Total View Count: ' || v_totalViewCount);
END;
/

/* Output the top 3 most watched videos, select the videoID, the title, and the viewcount. Do the same for the 3 most least watched videos. - Yooto */

WITH VideoRanks AS (
    SELECT
        videoid,
        title,
        viewcount,
        ROW_NUMBER() OVER (ORDER BY viewcount DESC) AS rank_high,
        ROW_NUMBER() OVER (ORDER BY viewcount ASC) AS rank_low
    FROM
        videoinfo
)
SELECT
    category,
    videoid,
    title,
    viewcount
FROM (
    SELECT
        'Top 3' AS category,
        videoid,
        title,
        viewcount
    FROM
        VideoRanks
    WHERE
        rank_high <= 3

    UNION ALL

    SELECT
        'Lowest 3' AS category,
        videoid,
        title,
        viewcount
    FROM
        VideoRanks
    WHERE
        rank_low <= 3
)
ORDER BY
    CASE
        WHEN category = 'Top 3' THEN 1
        WHEN category = 'Lowest 3' THEN 2
    END, viewcount DESC;
	
	
	






