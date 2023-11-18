/* videos with most comments - (Question 1) Stewart */
select videoinfo.videoid, sum(commentinfo.comments) as comment_total
from videoinfo join commentinfo on videoinfo.videoid = commentinfo.videoid
group by videoinfo.videoid
order by comment_total desc;


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



/* Output the top 3 most watched videos, select the videoID, the title, and the viewcount. Do the same for the 3 most least watched videos. - (Question 4) Stewart*/

select videoid, title, viewcount 
from videoinfo
order by viewcount desc
fetch first 3 rows only; 

select videoid, title, viewcount 
from videoinfo
order by viewcount asc
fetch first 3 rows only; 
	
	
	






