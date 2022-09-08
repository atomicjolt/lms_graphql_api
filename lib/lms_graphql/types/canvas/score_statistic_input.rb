require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasScoreStatisticInput < BaseInputObject
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        argument :min, Int, "Min score.Example: 1", required: false
        argument :max, Int, "Max score.Example: 10", required: false
        argument :mean, Int, "Mean score.Example: 6", required: false
        argument :upper_q, Int, "Upper quartile score.Example: 10", required: false
        argument :median, Int, "Median score.Example: 6", required: false
        argument :lower_q, Int, "Lower quartile score.Example: 1", required: false

      end
    end
  end
end