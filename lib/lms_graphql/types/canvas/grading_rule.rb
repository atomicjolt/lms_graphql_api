require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class GradingRule < BaseType
        description "Assignment Groups. API Docs: https://canvas.instructure.com/doc/api/assignment_groups.html"
        field :drop_lowest, Int, "Number of lowest scores to be dropped for each user..Example: 1", null: true
        field :drop_highest, Int, "Number of highest scores to be dropped for each user..Example: 1", null: true
        field :never_drop, Int, "Assignment IDs that should never be dropped..Example: 33, 17, 24", null: true

      end
    end
  end
end