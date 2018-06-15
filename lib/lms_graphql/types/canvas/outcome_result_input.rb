require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeResultInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        argument :id, ID, "A unique identifier for this result.Example: 42", required: false
        argument :score, Int, "The student's score.Example: 6", required: false
        argument :submitted_or_assessed_at, LMSGraphQL::Types::DateTimeType, "The datetime the resulting OutcomeResult was submitted at, or absent that, when it was assessed..Example: 2013-02-01T00:00:00-06:00", required: false
        argument :links, String, "Unique identifiers of objects associated with this result.Example: 3, 97, 53", required: false
        argument :percent, Float, "score's percent of maximum points possible for outcome, scaled to reflect any custom mastery levels that differ from the learning outcome.Example: 0.65", required: false

      end
    end
  end
end