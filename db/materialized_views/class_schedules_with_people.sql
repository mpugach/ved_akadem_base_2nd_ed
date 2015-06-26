DROP MATERIALIZED VIEW IF EXISTS class_schedules_with_people;

CREATE MATERIALIZED VIEW class_schedules_with_people AS
SELECT
  cs.id,
  cs.course_id,
  cs.teacher_profile_id,
  cs.classroom_id,
  cs.start_time,
  cs.finish_time,
  cs.subject,
  (
    SELECT tp.person_id
    FROM teacher_profiles tp
    WHERE tp.id = cs.teacher_profile_id
  ) AS teacher_id,
  ARRAY(
    SELECT DISTINCT p.id
    FROM people p
    INNER JOIN student_profiles sp ON sp.person_id = p.id
    INNER JOIN group_participations gp ON gp.student_profile_id = sp.id
    INNER JOIN academic_groups ag ON ag.id = gp.academic_group_id
    INNER JOIN academic_group_schedules ags ON ags.academic_group_id = ag.id
    WHERE
      ags.class_schedule_id = cs.id AND
      gp.leave_date IS NULL AND
      ag.graduated_at IS NULL
  ) AS people_ids
FROM class_schedules cs
WHERE finish_time > now()
ORDER BY
  cs.start_time ASC,
  cs.finish_time ASC
;
