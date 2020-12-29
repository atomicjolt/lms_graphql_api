require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasProvisionalGradeInput < BaseInputObject
        description "Moderated Grading. API Docs: https://canvas.instructure.com/doc/api/moderated_grading.html"
      argument :provisional_grade_id, ID, "The identifier for the provisional grade.Example: 23", required: false
      argument :score, Int, "The numeric score.Example: 90", required: false
      argument :grade, String, "The grade.Example: A-", required: false
      argument :grade_matches_current_submission, Boolean, "Whether the grade was applied to the most current submission (false if the student resubmitted after grading).Example: true", required: false
      argument :graded_at, LMSGraphQL::Types::DateTimeType, "When the grade was given.Example: 2015-11-01T00:03:21-06:00", required: false
      argument :final, Boolean, "Whether this is the 'final' provisional grade created by the moderator.", required: false
      argument :speedgrader_url, String, "A link to view this provisional grade in SpeedGrader™.Example: http://www.example.com/courses/123/gradebook/speed_grader?.", required: false

      end
    end
  end
end