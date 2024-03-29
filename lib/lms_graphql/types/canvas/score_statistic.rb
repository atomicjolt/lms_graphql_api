require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasScoreStatistic < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        field :min, Int, "Min score.Example: 1", null: true
        field :max, Int, "Max score.Example: 10", null: true
        field :mean, Int, "Mean score.Example: 6", null: true
        field :upper_q, Int, "Upper quartile score.Example: 10", null: true
        field :median, Int, "Median score.Example: 6", null: true
        field :lower_q, Int, "Lower quartile score.Example: 1", null: true

      end
    end
  end
end