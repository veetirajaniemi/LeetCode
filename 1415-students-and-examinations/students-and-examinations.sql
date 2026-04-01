# Write your MySQL query statement below
SELECT 
    st.student_id,
    st.student_name,
    su.subject_name,
    IFNULL(ex.ExamsTaken, 0) attended_exams
FROM Students AS st
CROSS JOIN Subjects AS su 
LEFT JOIN
    (SELECT *,
        COUNT(*) AS ExamsTaken
    FROM Examinations
    GROUP BY student_id, subject_name) AS ex
    ON st.student_id = ex.student_id AND su.subject_name = ex.subject_name
ORDER BY st.student_id, su.subject_name