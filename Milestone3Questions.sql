/*
The database had null values. Therefore we removed the null values for
the accuracy of the questions
*/

DELETE FROM videoinfo WHERE videoid = 'cyLWtMSry58';
DELETE FROM videoinfo WHERE videoid = 'f_uwKZIAeM0' ;


/* Question #1 

Retrieve the top 3 videos with the most comments. SELECT the videoID and get the SUM of comments. 
Only output the first three rows of the query. You must use the FETCH statement. 

*/
SET SERVEROUTPUT ON;
DECLARE
    CURSOR video_comments_cursor IS
        SELECT v.VIDEOID, COUNT(c.COMMENTID) AS comment_total
        FROM VideoInfo v
        JOIN CommentInfo c ON v.VIDEOID = c.VIDEOID
        GROUP BY v.VIDEOID
        ORDER BY comment_total DESC
        FETCH FIRST 3 ROWS ONLY;
    video_id VideoInfo.VIDEOID%TYPE;
    comment_total INT;
BEGIN
    FOR video_comments_rec IN video_comments_cursor LOOP
        video_id := video_comments_rec.VIDEOID;
        comment_total := video_comments_rec.comment_total;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Comment Total: ' || comment_total);    
    END LOOP;
END;
/

/* Question #2

Retrieve the average view count of all videos and put them in descending order.
Add error handling for null values for viewcount, and output all records side by side.

*/

DECLARE
    CURSOR video_avg_view_cursor IS
        SELECT videoID, ROUND(AVG(NVL(viewCount, 0)), 2) AS averageViewCount
        FROM VideoInfo
        GROUP BY videoID
        ORDER BY averageViewCount DESC;
    video_id VideoInfo.VIDEOID%TYPE;
    avg_view_count NUMBER;
BEGIN
    FOR video_avg_view_rec IN video_avg_view_cursor LOOP
        video_id := video_avg_view_rec.videoID;
        avg_view_count := video_avg_view_rec.averageViewCount;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Average View Count: ' || avg_view_count);
    END LOOP;
END;
/

/* Query Results:
Video ID: FzG4uDgje3M | Average View Count: 4034122271
Video ID: gCYcHz2k5x0 | Average View Count: 1582262997
Video ID: XXYlFuWEuKI | Average View Count: 915457091
Video ID: qpgTC9MDx1o | Average View Count: 826423766
Video ID: jJPMnTXl63E | Average View Count: 524709805
Video ID: yjmp8CoZBIo | Average View Count: 434352213
Video ID: Ct6BUPvE2sM | Average View Count: 425478119
Video ID: mRD0-GxqHVo | Average View Count: 378164492
Video ID: Ha80ZaecGkQ | Average View Count: 321977550
Video ID: nhBorPm6JjQ | Average View Count: 308501014
Video ID: NvR60Wg9R7Q | Average View Count: 302125099
Video ID: 0e3GPea1Tyg | Average View Count: 285526909
Video ID: fyIcQ1Xl-rs | Average View Count: 250793774
Video ID: EqboAI-Vk-U | Average View Count: 239207161
Video ID: nCg3ufihKyU | Average View Count: 208293677
Video ID: 7BJ3ZXpserc | Average View Count: 193685278
Video ID: 9bqk6ZUsKyA | Average View Count: 191988678
Video ID: zxYjTTXc-J8 | Average View Count: 180766617
Video ID: h4UqMyldS7Q | Average View Count: 168546247
Video ID: XnitQYkYYcw | Average View Count: 161103805
Video ID: QxGVgXf_LNk | Average View Count: 160818375
Video ID: F4Y3Pkn95GI | Average View Count: 156000008
Video ID: 4-43lLKaqBQ | Average View Count: 153478497
Video ID: xuCn8ux2gbs | Average View Count: 147339243
Video ID: ul1H_p_FeaA | Average View Count: 145167323
Video ID: erQ_9yEz0ls | Average View Count: 136439525
Video ID: A-vX1AGBGsc | Average View Count: 134377650
Video ID: 3jS_yEK8qVI | Average View Count: 125670049
Video ID: =-EjsCBHEbbk | Average View Count: 122994457
Video ID: dg2Ag3e8W-Q | Average View Count: 116842899
Video ID: LeYsRMZFUq0 | Average View Count: 110124989
Video ID: xRwy_rKc7gI | Average View Count: 107126467
*/


/* Question #3

The 3 videos with the lowest amount of comments. Use FETCH. 

*/

SET SERVEROUTPUT ON;
DECLARE
    CURSOR comment_count_cursor IS
        SELECT c.videoID, v.title, COUNT(c.CommentID) AS commentCount
        FROM CommentInfo c
        JOIN VideoInfo v ON c.videoID = v.videoID
        GROUP BY c.videoID, v.title
        ORDER BY commentCount ASC
        FETCH FIRST 10 ROWS ONLY;
    video_id CommentInfo.VIDEOID%TYPE;
    title VideoInfo.TITLE%TYPE;
    comment_count NUMBER;
BEGIN
    FOR comment_count_rec IN comment_count_cursor LOOP
        video_id := comment_count_rec.videoID;
        title := comment_count_rec.title;
        comment_count := comment_count_rec.commentCount;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Title: ' || title || ' | Comment Count: ' || comment_count);
    END LOOP;
END;
/


/* Query Results:

Video ID: voU9-39bicg | Title: ¿¿¿¿¿¿¿¿¿¿¿:¿¿¿¿¿¿¿¿¿¿¿/¿¿¿¿¿¿¿¿¿¿¿¿¿¿/¿¿¿¿¿¿¿¿¿¿¿¿¿ ¿¿¿/¿¿VS¿¿/¿¿¿¿¿¿¿¿/¿¿¿¿¿¿ ¿¿(¿¿¿NEWSLIVE) | Comment Count: 1
Video ID: 0vEdNPoeemQ | Title: Tech firms can&#39;t hide behind advertising rules with financial products, says CFPB chief | Comment Count: 1
Video ID: oXGVGXAx9Ng | Title: Odyssey ¿ Smooth Lofi Beats To Relax, Study, Vibe To (Lofi Mix) | Comment Count: 1
Video ID: LIdwACwZ7E4 | Title: Can You spot the Fake Rubik’s Cube? ¿ | Comment Count: 1
Video ID: be1frkduYbY | Title: Was bringt das Apple-September-2022-Event - 4K | Apfeltalk | Comment Count: 1
Video ID: rlV10AFUES0 | Title: How to Create Weekly Planner For Business - Canva For Beginners | Comment Count: 1
Video ID: ETsM6CGZ0_Y | Title: Canadian Ultimate Championships Juniors: Open Final | Ultimate Frisbee | CBC Sports | Comment Count: 1
Video ID: 6lbJ55D7rKg | Title: Sony PlayStation is PAYING for Games NOT to go on Xbox Game Pass?! | Comment Count: 1
Video ID: 9QW7CORIoFw | Title: SAY HALO To Animals!!!|Doodle with me (Part 4) | Comment Count: 1
Video ID: E3R0mnnMP0k | Title: Rep. Boebert skips crypto reporting cutoff, and cutting emissions with blockchain: CNBC Crypto World | Comment Count: 1

*/


/* Question #4

List the top 3 videos with the most views, then list the lowest 3 videos 
with the least amount of views. 

*/

DECLARE
    CURSOR top3_desc_cursor IS
        SELECT videoid, title, NVL(viewcount, 0) AS viewcount
        FROM videoinfo
        ORDER BY viewcount DESC
        FETCH FIRST 3 ROWS ONLY;
    CURSOR top3_asc_cursor IS
        SELECT videoid, title, NVL(viewcount, 0) AS viewcount
        FROM videoinfo
        ORDER BY viewcount ASC
        FETCH FIRST 3 ROWS ONLY;
    video_id VideoInfo.VIDEOID%TYPE;
    title VideoInfo.TITLE%TYPE;
    view_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 Videos (Descending Order):');
    FOR desc_rec IN top3_desc_cursor LOOP
        video_id := desc_rec.videoid;
        title := desc_rec.title;
        view_count := desc_rec.viewcount;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Title: ' || title || ' | View Count: ' || view_count);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Top 3 Videos (Ascending Order):');
    FOR asc_rec IN top3_asc_cursor LOOP
        video_id := asc_rec.videoid;
        title := asc_rec.title;
        view_count := asc_rec.viewcount;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Title: ' || title || ' | View Count: ' || view_count);
    END LOOP;
END;
/


/* Query Results:

Top 3 Videos (Descending Order):
Video ID: FzG4uDgje3M | Title: El Chombo - Dame Tu Cosita feat. Cutty Ranks (Official Video) [Ultra Music] | View Count: 4034122271
Video ID: gCYcHz2k5x0 | Title: Martin Garrix - Animals (Official Video) | View Count: 1582262997
Video ID: XXYlFuWEuKI | Title: The Weeknd - Save Your Tears (Official Music Video) | View Count: 915457091
Top 3 Videos (Ascending Order):
Video ID: V_vguZj_7FE | Title: Mathematics and Chemistry : MathChemistry.com : Masters Degree in Math | View Count: 25
Video ID: TlEpQgYBS0E | Title: Mathematics and Chemistry : MathChemistry.com : Masters Degree in Math | View Count: 63
Video ID: =-Mv5KqtuVrc | Title: How to Assess ANY Chess Position: The Ultimate Guide | View Count: 601

*/


/* Question #5

Select the top 3 videos with the most comments. Use a LOOP. 

*/
SET SERVEROUTPUT ON;
DECLARE
    CURSOR top3_comment_count_cursor IS
        SELECT c.videoID, v.title, COUNT(c.CommentID) AS commentCount
        FROM CommentInfo c
        JOIN VideoInfo v ON c.videoID = v.videoID
        GROUP BY c.videoID, v.title
        ORDER BY commentCount DESC
        FETCH FIRST 3 ROWS ONLY;
    video_id CommentInfo.VIDEOID%TYPE;
    title VideoInfo.TITLE%TYPE;
    comment_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 Videos with Most Comments:');
    FOR comment_count_rec IN top3_comment_count_cursor LOOP
        video_id := comment_count_rec.videoID;
        title := comment_count_rec.title;
        comment_count := comment_count_rec.commentCount;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Title: ' || title || ' | Comment Count: ' || comment_count);
    END LOOP;
END;
/

/* Query Results:

Top 3 Videos with Most Comments:
Video ID: LeC5yJq4tsI | Title: 20 Minecraft Block Facts You Maybe Didn&#39;t Know | Comment Count: 20
Video ID: ZgeorpjGJC0 | Title: Lofi For Reading ¿ Lofi Hip Hop | Study Music ¿ Study Beats | Lofi Study Music | Comment Count: 20
Video ID: mqc6QqoGNWI | Title: ASMR Gaming ¿ Fortnite 1 Kill = 1 Trigger Relaxing Mouth Sounds ¿¿ Controller Sounds + Whispering ¿ | Comment Count: 18

*/


/* Question #6

Find the correlation between video popularity and upload date. 
Find the date uploaded of all videos, and calculate the average viewcount of all videos
within that day. 

*/
DECLARE
    CURSOR upload_date_avg_views_cursor IS
        SELECT date_uploaded, average_views
        FROM (
            SELECT TO_CHAR(uploaddate, 'DD-MON-YYYY') AS date_uploaded, AVG(viewcount) AS average_views
            FROM VideoInfo
            GROUP BY TO_CHAR(uploaddate, 'DD-MON-YYYY')
        ) ORDER BY date_uploaded;
    date_uploaded VARCHAR2(20);
    average_views NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Average Views Grouped by Upload Date (Ascending Order):');
    FOR upload_date_avg_views_rec IN upload_date_avg_views_cursor LOOP
        date_uploaded := upload_date_avg_views_rec.date_uploaded;
        average_views := upload_date_avg_views_rec.average_views;
        DBMS_OUTPUT.PUT_LINE('Date Uploaded: ' || date_uploaded || ' | Average Views: ' || average_views);
    END LOOP;
END;
/


/* Query Results:

Average Views Grouped by Upload Date (Ascending Order):
Date Uploaded: 01-APR-2019 | Average Views: 143605
Date Uploaded: 01-APR-2020 | Average Views: 524709805
Date Uploaded: 01-APR-2022 | Average Views: 383734
Date Uploaded: 01-AUG-2022 | Average Views: 1706457
Date Uploaded: 01-DEC-2019 | Average Views: 689166
Date Uploaded: 01-DEC-2020 | Average Views: 1670627
Date Uploaded: 01-FEB-2011 | Average Views: 14800155
Date Uploaded: 01-FEB-2017 | Average Views: 10682194.5
Date Uploaded: 01-FEB-2018 | Average Views: 793228
Date Uploaded: 01-FEB-2022 | Average Views: 595260.5
Date Uploaded: 01-JAN-2022 | Average Views: 855620
Date Uploaded: 01-JUL-2018 | Average Views: 800364
Date Uploaded: 01-JUN-2018 | Average Views: 7906241
Date Uploaded: 01-JUN-2019 | Average Views: 37780348
Date Uploaded: 01-JUN-2020 | Average Views: 215489
Date Uploaded: 01-JUN-2022 | Average Views: 713127.3333333333333333333333333333333333
Date Uploaded: 01-MAR-2017 | Average Views: 1750656
Date Uploaded: 01-MAR-2022 | Average Views: 123228
Date Uploaded: 01-MAY-2021 | Average Views: 2354668
Date Uploaded: 01-MAY-2022 | Average Views: 4606124
Date Uploaded: 01-NOV-2017 | Average Views: 872008
Date Uploaded: 01-OCT-2020 | Average Views: 367200
Date Uploaded: 01-OCT-2021 | Average Views: 589907
Date Uploaded: 02-APR-2012 | Average Views: 8639567
Date Uploaded: 02-APR-2022 | Average Views: 4099070.2
Date Uploaded: 02-AUG-2017 | Average Views: 196484
Date Uploaded: 02-AUG-2022 | Average Views: 1786905
Date Uploaded: 02-DEC-2020 | Average Views: 2615459
Date Uploaded: 02-DEC-2021 | Average Views: 12703147
Date Uploaded: 02-JAN-2017 | Average Views: 844015
Date Uploaded: 02-JAN-2022 | Average Views: 305650

*/


/* Question #7

Find the most popular upload date and count the number of videos uploaded per date. 
Use FETCH(First 10 Rows) and order by descending order of Upload_Count. 

*/

DECLARE
    CURSOR upload_count_cursor IS
        SELECT date_uploaded, upload_count
        FROM (
            SELECT TO_CHAR(uploaddate, 'DD-MON-YYYY') AS date_uploaded,
                   COUNT(*) AS upload_count,
                   ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rn
            FROM VideoInfo
            GROUP BY TO_CHAR(uploaddate, 'DD-MON-YYYY')
        ) WHERE rn <= 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 10 Upload Dates with Upload Count (Descending Order):');
    FOR upload_count_rec IN upload_count_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Date Uploaded: ' || upload_count_rec.date_uploaded || ' | Upload Count: ' || upload_count_rec.upload_count);
    END LOOP;
END;
/


/* Question #8

Find the video with the most engagement (comments + likes). 

*/

DECLARE
    CURSOR engagement_cursor IS
        SELECT e.videoID, v.title, (e.likes + e.comments) AS totalEngagement
        FROM EngagementMetrics e
        JOIN VideoInfo v ON e.videoID = v.videoID
        ORDER BY totalEngagement DESC
        FETCH FIRST 1 ROW ONLY;
    video_id EngagementMetrics.VIDEOID%TYPE;
    title VideoInfo.TITLE%TYPE;
    total_engagement NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Video with Highest Total Engagement:');
    FOR engagement_rec IN engagement_cursor LOOP
        video_id := engagement_rec.videoID;
        title := engagement_rec.title;
        total_engagement := engagement_rec.totalEngagement;
        DBMS_OUTPUT.PUT_LINE('Video ID: ' || video_id || ' | Title: ' || title || ' | Total Engagement: ' || total_engagement);
    END LOOP;
END;
/


/* Query Results:

Video with Highest Total Engagement:
Video ID: nmY2kgWYwyQ | Title: I bought the THINNEST Tech in the world. | Total Engagement: 377380

*/


/* Question #9



*/




/* Question #10

Query that outputs the total viewcount, number of comments, number of likes, of a specified video. 
It outputs the title of the video, and the statistics 

*/

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

	






