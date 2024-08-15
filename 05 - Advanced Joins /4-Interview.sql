WITH sum_view_stats AS (
    SELECT challenge_id,
           Sum(total_views) as total_views,
           Sum(total_unique_views) as total_unique_views
    FROM   view_stats
    GROUP BY challenge_id),
sum_submission_stats AS (
    SELECT challenge_id,
                Sum(total_submissions) as total_submissions,
                Sum(total_accepted_submissions) as total_accepted_submissions
         FROM   submission_stats
         GROUP BY challenge_id)
SELECT con.contest_id,
       con.hacker_id,
       con.NAME,
       Sum(total_submissions),
       Sum(total_accepted_submissions),
       Sum(total_views),
       Sum(total_unique_views)
FROM   contests c INNER JOIN colleges c1 ON c.contest_id = c1.contest_id
                    INNER JOIN challenges c2 ON c2.college_id = c1.college_id
                    LEFT JOIN sum_view_stats v ON v.challenge_id = c2.challenge_id
                    LEFT JOIN sum_submission_stats s ON s.challenge_id = c2.challenge_id
GROUP BY 1, 2, 3
HAVING (Sum(total_submissions) + Sum(total_accepted_submissions) + Sum(total_views) + Sum(total_unique_views) ) <> 0
ORDER BY 1



-- Explanation :  The tables Submission_Stats, View_Stats contains multiple entries for same contest id. Hence we need to calculate sum by grouping with contest id before joining. 
