require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasResult < BaseType
          description "Result. API Docs: https://canvas.instructure.com/doc/api/result.html"
        field :id, ID, "The fully qualified URL for showing the Result.Example: http://institution.canvas.com/api/lti/courses/5/line_items/2/results/1", null: true
        field :user_id, String, "The lti_user_id or the Canvas user_id.Example: 50 | 'abcasdf'", null: true
        field :result_score, Float, "The score of the result as defined by Canvas, scaled to the resultMaximum.Example: 50", null: true
        field :result_maximum, Float, "Maximum possible score for this result; 1 is the default value and will be assumed if not specified otherwise. Minimum value of 0 required..Example: 50", null: true
        field :comment, String, "Comment visible to the student about the result..", null: true
        field :score_of, String, "URL of the line item this belongs to.Example: http://institution.canvas.com/api/lti/courses/5/line_items/2", null: true

      end
    end
  end
end