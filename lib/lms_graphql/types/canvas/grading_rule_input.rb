require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradingRuleInput < BaseInputObject
          description "Assignment Groups. API Docs: https://canvas.instructure.com/doc/api/assignment_groups.html"
      argument :drop_lowest, Int, "Number of lowest scores to be dropped for each user..Example: 1", required: false
      argument :drop_highest, Int, "Number of highest scores to be dropped for each user..Example: 1", required: false
      argument :never_drop, [Int], "Assignment IDs that should never be dropped..Example: 33, 17, 24", required: false

      end
    end
  end
end