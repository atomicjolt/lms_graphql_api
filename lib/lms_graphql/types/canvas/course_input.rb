require_relative "../canvas_base_input_type"
require_relative "enrollment"
require_relative "calendar_link"
require_relative "term"
require_relative "course_progress"

module LMSGraphQL
  module Types
    module Canvas
        class CourseWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "unpublished"
          value "available"
          value "completed"
          value "deleted"
        end

                class CourseDefaultViewEnum < ::GraphQL::Schema::Enum
          value "feed"
          value "wiki"
          value "modules"
          value "syllabus"
          value "assignments"
        end
      class CanvasCourseInput < BaseInputObject
        description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
      	argument :id, ID, "the unique identifier for the course.Example: 370663", required: false
      	argument :sis_course_id, ID, "the SIS identifier for the course, if defined. This field is only included if the user has permission to view SIS information..", required: false
      	argument :uuid, String, "the UUID of the course.Example: WvAHhY5FINzq5IyRIJybGeiXyFkG3SqHUPb7jZY5", required: false
      	argument :integration_id, ID, "the integration identifier for the course, if defined. This field is only included if the user has permission to view SIS information..", required: false
      	argument :sis_import_id, ID, "the unique identifier for the SIS import. This field is only included if the user has permission to manage SIS information..Example: 34", required: false
      	argument :name, String, "the full name of the course.Example: InstructureCon 2012", required: false
      	argument :course_code, String, "the course code.Example: INSTCON12", required: false
      	argument :workflow_state, CourseWorkflowStateEnum, "the current state of the course one of 'unpublished', 'available', 'completed', or 'deleted'.Example: available", required: false
      	argument :account_id, ID, "the account associated with the course.Example: 81259", required: false
      	argument :root_account_id, ID, "the root account associated with the course.Example: 81259", required: false
      	argument :enrollment_term_id, ID, "the enrollment term associated with the course.Example: 34", required: false
      	argument :grading_standard_id, ID, "the grading standard associated with the course.Example: 25", required: false
      	argument :grade_passback_setting, String, "the grade_passback_setting set on the course.Example: nightly_sync", required: false
      	argument :created_at, LMSGraphQL::Types::DateTimeType, "the date the course was created..Example: 2012-05-01T00:00:00-06:00", required: false
      	argument :start_at, LMSGraphQL::Types::DateTimeType, "the start date for the course, if applicable.Example: 2012-06-01T00:00:00-06:00", required: false
      	argument :end_at, LMSGraphQL::Types::DateTimeType, "the end date for the course, if applicable.Example: 2012-09-01T00:00:00-06:00", required: false
      	argument :locale, String, "the course-set locale, if applicable.Example: en", required: false
      	argument :enrollments, [LMSGraphQL::Types::Canvas::CanvasEnrollmentInput], "A list of enrollments linking the current user to the course. for student enrollments, grading information may be included if include[]=total_scores.", required: false
      	argument :total_students, Int, "optional: the total number of active and invited students in the course.Example: 32", required: false
      	argument :calendar, LMSGraphQL::Types::Canvas::CanvasCalendarLinkInput, "course calendar.", required: false
      	argument :default_view, CourseDefaultViewEnum, "the type of page that users will see when they first visit the course - 'feed': Recent Activity Dashboard - 'wiki': Wiki Front Page - 'modules': Course Modules/Sections Page - 'assignments': Course Assignments List - 'syllabus': Course Syllabus Page other types may be added in the future.Example: feed", required: false
      	argument :syllabus_body, String, "optional: user-generated HTML for the course syllabus.Example: <p>syllabus html goes here</p>", required: false
      	argument :needs_grading_count, Int, "optional: the number of submissions needing grading returned only if the current user has grading rights and include[]=needs_grading_count.Example: 17", required: false
      	argument :term, LMSGraphQL::Types::Canvas::CanvasTermInput, "optional: the enrollment term object for the course returned only if include[]=term.", required: false
      	argument :course_progress, LMSGraphQL::Types::Canvas::CanvasCourseProgressInput, "optional: information on progress through the course returned only if include[]=course_progress.", required: false
      	argument :apply_assignment_group_weights, Boolean, "weight final grade based on assignment group percentages.Example: true", required: false
      	argument :permissions, String, "optional: the permissions the user has for the course. returned only for a single course and include[]=permissions.Example: true, true", required: false
      	argument :is_public, Boolean, "Example: true", required: false
      	argument :is_public_to_auth_users, Boolean, "Example: true", required: false
      	argument :public_syllabus, Boolean, "Example: true", required: false
      	argument :public_syllabus_to_auth, Boolean, "Example: true", required: false
      	argument :public_description, String, "optional: the public description of the course.Example: Come one, come all to InstructureCon 2012!", required: false
      	argument :storage_quota_mb, Int, "Example: 5", required: false
      	argument :storage_quota_used_mb, Float, "Example: 5", required: false
      	argument :hide_final_grades, Boolean, "", required: false
      	argument :license, String, "Example: Creative Commons", required: false
      	argument :allow_student_assignment_edits, Boolean, "", required: false
      	argument :allow_wiki_comments, Boolean, "", required: false
      	argument :allow_student_forum_attachments, Boolean, "", required: false
      	argument :open_enrollment, Boolean, "Example: true", required: false
      	argument :self_enrollment, Boolean, "", required: false
      	argument :restrict_enrollments_to_course_dates, Boolean, "", required: false
      	argument :course_format, String, "Example: online", required: false
      	argument :access_restricted_by_date, Boolean, "optional: this will be true if this user is currently prevented from viewing the course because of date restriction settings.", required: false
      	argument :time_zone, String, "The course's IANA time zone name..Example: America/Denver", required: false
      	argument :blueprint, Boolean, "optional: whether the course is set as a Blueprint Course (blueprint fields require the Blueprint Courses feature).Example: true", required: false
      	argument :blueprint_restrictions, String, "optional: Set of restrictions applied to all locked course objects.Example: true, true, false, false", required: false
      	argument :blueprint_restrictions_by_object_type, String, "optional: Sets of restrictions differentiated by object type applied to locked course objects.Example: {'content'=>true, 'points'=>true}, {'content'=>true}", required: false

      end
    end
  end
end