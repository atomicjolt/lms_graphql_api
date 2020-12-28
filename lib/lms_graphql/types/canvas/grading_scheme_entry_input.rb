require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradingSchemeEntryInput < BaseInputObject
        description "Grading Standards. API Docs: https://canvas.instructure.com/doc/api/grading_standards.html"
      argument :name, String, "The name for an entry value within a GradingStandard that describes the range of the value.Example: A", required: false
      argument :value, Int, "The value for the name of the entry within a GradingStandard.  The entry represents the lower bound of the range for the entry. This range includes the value up to the next entry in the GradingStandard, or 100 if there is no upper bound. The lowest value will have a lower bound range of 0..Example: 0.9", required: false

      end
    end
  end
end