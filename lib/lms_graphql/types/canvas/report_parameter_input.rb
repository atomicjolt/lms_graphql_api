require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasReportParameterInput < BaseInputObject
          class ReportParameterOrderEnum < ::GraphQL::Schema::Enum
          value "users"
          value "courses"
          value "outcomes"
        end
        description "Account Reports. API Docs: https://canvas.instructure.com/doc/api/account_reports.html"
      argument :enrollment_term_id, ID, "The canvas id of the term to get grades from.Example: 2", required: false
      argument :include_deleted, Boolean, "If true, deleted objects will be included. If false, deleted objects will be omitted..", required: false
      argument :course_id, ID, "The id of the course to report on.Example: 2", required: false
      argument :order, ReportParameterOrderEnum, "The sort order for the csv, Options: 'users', 'courses', 'outcomes'..Example: users", required: false
      argument :users, Boolean, "If true, user data will be included. If false, user data will be omitted..", required: false
      argument :accounts, Boolean, "If true, account data will be included. If false, account data will be omitted..", required: false
      argument :terms, Boolean, "If true, term data will be included. If false, term data will be omitted..", required: false
      argument :courses, Boolean, "If true, course data will be included. If false, course data will be omitted..", required: false
      argument :sections, Boolean, "If true, section data will be included. If false, section data will be omitted..", required: false
      argument :enrollments, Boolean, "If true, enrollment data will be included. If false, enrollment data will be omitted..", required: false
      argument :groups, Boolean, "If true, group data will be included. If false, group data will be omitted..", required: false
      argument :xlist, Boolean, "If true, data for crosslisted courses will be included. If false, data for crosslisted courses will be omitted..", required: false
      argument :sis_terms_csv, Int, "Example: 1", required: false
      argument :sis_accounts_csv, Int, "Example: 1", required: false
      argument :include_enrollment_state, Boolean, "If true, enrollment state will be included. If false, enrollment state will be omitted. Defaults to false..", required: false
      argument :enrollment_state, [String], "Include enrollment state. Defaults to 'all' Options: ['active'| 'invited'| 'creation_pending'| 'deleted'| 'rejected'| 'completed'| 'inactive'| 'all'].Example: all", required: false
      argument :start_at, LMSGraphQL::Types::DateTimeType, "The beginning date for submissions. Max time range is 2 weeks..Example: 2012-07-13T10:55:20-06:00", required: false
      argument :end_at, LMSGraphQL::Types::DateTimeType, "The end date for submissions. Max time range is 2 weeks..Example: 2012-07-13T10:55:20-06:00", required: false

      end
    end
  end
end