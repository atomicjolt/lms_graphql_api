require_relative "../canvas_base_input_type"
require_relative "grade_change_event_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradeChangeEventInput < BaseInputObject
          description "Grade Change Log. API Docs: https://canvas.instructure.com/doc/api/grade_change_log.html"
      argument :id, ID, "ID of the event..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "timestamp of the event.Example: 2012-07-19T15:00:00-06:00", required: false
      argument :event_type, String, "GradeChange event type.Example: grade_change", required: false
      argument :excused_after, Boolean, "Boolean indicating whether the submission was excused after the change..Example: true", required: false
      argument :excused_before, Boolean, "Boolean indicating whether the submission was excused before the change..", required: false
      argument :grade_after, String, "The grade after the change..Example: 8", required: false
      argument :grade_before, String, "The grade before the change..Example: 8", required: false
      argument :graded_anonymously, Boolean, "Boolean indicating whether the student name was visible when the grade was given. Could be null if the grade change record was created before this feature existed..Example: true", required: false
      argument :version_number, String, "Version Number of the grade change submission..Example: 1", required: false
      argument :request_id, ID, "The unique request id of the request during the grade change..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", required: false
      argument :links, LMSGraphQL::Types::Canvas::CanvasGradeChangeEventLinkInput, "", required: false

      end
    end
  end
end