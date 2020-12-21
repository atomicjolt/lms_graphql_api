require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasResultInput < BaseInputObject
        description "Result. API Docs: https://canvas.instructure.com/doc/api/result.html"
      	argument :id, ID, "The fully qualified URL for showing the Result.Example: http://institution.canvas.com/api/lti/courses/5/line_items/2/results/1", required: false
      	argument :user_id, String, "The lti_user_id or the Canvas user_id.Example: 50 | 'abcasdf'", required: false
      	argument :result_score, Float, "The score of the result as defined by Canvas, scaled to the resultMaximum.Example: 50", required: false
      	argument :result_maximum, Float, "Maximum possible score for this result; 1 is the default value and will be assumed if not specified otherwise. Minimum value of 0 required..Example: 50", required: false
      	argument :comment, String, "Comment visible to the student about the result..", required: false
      	argument :score_of, String, "URL of the line item this belongs to.Example: http://institution.canvas.com/api/lti/courses/5/line_items/2", required: false

      end
    end
  end
end