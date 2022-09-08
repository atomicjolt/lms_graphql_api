require_relative "../canvas_base_input_type"
require_relative "grade"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasEnrollmentInput < BaseInputObject
          description "Enrollments. API Docs: https://canvas.instructure.com/doc/api/enrollments.html"
        argument :id, ID, "The ID of the enrollment..Example: 1", required: false
        argument :course_id, ID, "The unique id of the course..Example: 1", required: false
        argument :sis_course_id, ID, "The SIS Course ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", required: false
        argument :course_integration_id, ID, "The Course Integration ID in which the enrollment is associated. This field is only included if the user has permission to view SIS information..Example: SHEL93921", required: false
        argument :course_section_id, ID, "The unique id of the user's section..Example: 1", required: false
        argument :section_integration_id, ID, "The Section Integration ID in which the enrollment is associated. This field is only included if the user has permission to view SIS information..Example: SHEL93921", required: false
        argument :sis_account_id, ID, "The SIS Account ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", required: false
        argument :sis_section_id, ID, "The SIS Section ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", required: false
        argument :sis_user_id, ID, "The SIS User ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", required: false
        argument :enrollment_state, String, "The state of the user's enrollment in the course..Example: active", required: false
        argument :limit_privileges_to_course_section, Boolean, "User can only access his or her own course section..Example: true", required: false
        argument :sis_import_id, ID, "The unique identifier for the SIS import. This field is only included if the user has permission to manage SIS information..Example: 83", required: false
        argument :root_account_id, ID, "The unique id of the user's account..Example: 1", required: false
        argument :type, String, "The enrollment type. One of 'StudentEnrollment', 'TeacherEnrollment', 'TaEnrollment', 'DesignerEnrollment', 'ObserverEnrollment'..Example: StudentEnrollment", required: false
        argument :user_id, ID, "The unique id of the user..Example: 1", required: false
        argument :associated_user_id, ID, "The unique id of the associated user. Will be null unless type is ObserverEnrollment..", required: false
        argument :role, String, "The enrollment role, for course-level permissions. This field will match `type` if the enrollment role has not been customized..Example: StudentEnrollment", required: false
        argument :role_id, ID, "The id of the enrollment role..Example: 1", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "The created time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, "The updated time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", required: false
        argument :start_at, GraphQL::Types::ISO8601DateTime, "The start time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", required: false
        argument :end_at, GraphQL::Types::ISO8601DateTime, "The end time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", required: false
        argument :last_activity_at, GraphQL::Types::ISO8601DateTime, "The last activity time of the user for the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", required: false
        argument :last_attended_at, GraphQL::Types::ISO8601DateTime, "The last attended date of the user for the enrollment in a course, in ISO8601 format..Example: 2012-04-18T23:08:51Z", required: false
        argument :total_activity_time, Int, "The total activity time of the user for the enrollment, in seconds..Example: 260", required: false
        argument :html_url, String, "The URL to the Canvas web UI page for this course enrollment..Example: https://.", required: false
        argument :grades, LMSGraphQL::Types::Canvas::CanvasGradeInput, "The URL to the Canvas web UI page containing the grades associated with this enrollment..Example: https://., 35, , 6.67, ", required: false
        argument :user, LMSGraphQL::Types::Canvas::CanvasUserInput, "A description of the user..Example: 3, Student 1, 1, Student, Stud 1", required: false
        argument :override_grade, String, "The user's override grade for the course..Example: A", required: false
        argument :override_score, Float, "The user's override score for the course..Example: 99.99", required: false
        argument :unposted_current_grade, String, "The user's current grade in the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins..", required: false
        argument :unposted_final_grade, String, "The user's final grade for the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins...", required: false
        argument :unposted_current_score, String, "The user's current score in the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", required: false
        argument :unposted_final_score, String, "The user's final score for the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", required: false
        argument :has_grading_periods, Boolean, "optional: Indicates whether the course the enrollment belongs to has grading periods set up. (applies only to student enrollments, and only available in course endpoints).Example: true", required: false
        argument :totals_for_all_grading_periods_option, Boolean, "optional: Indicates whether the course the enrollment belongs to has the Display Totals for 'All Grading Periods' feature enabled. (applies only to student enrollments, and only available in course endpoints).Example: true", required: false
        argument :current_grading_period_title, String, "optional: The name of the currently active grading period, if one exists. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: Fall Grading Period", required: false
        argument :current_grading_period_id, ID, "optional: The id of the currently active grading period, if one exists. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 5", required: false
        argument :current_period_override_grade, String, "The user's override grade for the current grading period..Example: A", required: false
        argument :current_period_override_score, Float, "The user's override score for the current grading period..Example: 99.99", required: false
        argument :current_period_unposted_current_score, Float, "optional: The student's score in the course for the current grading period, including muted/unposted assignments. Only included if user has permission to view this score, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 95.8", required: false
        argument :current_period_unposted_final_score, Float, "optional: The student's score in the course for the current grading period, including muted/unposted assignments and including ungraded assignments with a score of 0. Only included if user has permission to view this score, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 85.25", required: false
        argument :current_period_unposted_current_grade, String, "optional: The letter grade equivalent of current_period_unposted_current_score, if available. Only included if user has permission to view this grade, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: A", required: false
        argument :current_period_unposted_final_grade, String, "optional: The letter grade equivalent of current_period_unposted_final_score, if available. Only included if user has permission to view this grade, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: B", required: false

      end
    end
  end
end